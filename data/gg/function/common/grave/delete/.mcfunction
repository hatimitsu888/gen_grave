#> gg:common:grave/delete/
# プレイヤーとお墓のidから特定のお墓を削除する

# プレイヤーの情報を取得する
function gg:common/player/fetch_data with storage gg_tmp: id

# お墓の情報を取得する
function gg:common/grave/fetch_data with storage gg_tmp: id


# お墓の位置をセット
execute store result storage gg_tmp: chunkLoad.x int 1 run data get storage gg_tmp: grave.pos[0] 1
execute store result storage gg_tmp: chunkLoad.z int 1 run data get storage gg_tmp: grave.pos[2] 1

# ディメンションを取得
data modify storage gg_tmp: chunkLoad.dimension set from storage gg_tmp: grave.dimension

# お墓の位置をロード
function gg:common/load with storage gg_tmp: chunkLoad

# お墓が読み込まれていたらそのまま実行
execute store result storage gg_tmp: loaded.pos.x int 1 run data get storage gg_tmp: grave.pos[0] 1
execute store result storage gg_tmp: loaded.pos.y int 1 run data get storage gg_tmp: grave.pos[1] 1
execute store result storage gg_tmp: loaded.pos.z int 1 run data get storage gg_tmp: grave.pos[2] 1
data modify storage gg_tmp: loaded.pos.dimension set from storage gg_tmp: grave.dimension
function gg:common/loaded with storage gg_tmp: loaded.pos
execute if data storage gg_tmp: {loaded:{isLoaded:1b}} run return run function gg:common/grave/delete/delete

# 非同期処理を開始
data modify storage gg_async: processes append value {id:"delete", pass:{pId:-1, gId:-1}, chunk:{x:0, y:0, z:0, dimension: ""}}
data modify storage gg_async: processes[-1].pass.pId set from storage gg_tmp: id.player
data modify storage gg_async: processes[-1].pass.gId set from storage gg_tmp: id.grave
data modify storage gg_async: processes[-1].chunk set from storage gg_tmp: loaded.pos
data modify storage gg_async: processes[-1].pass.chunkLoad set from storage gg_tmp: chunkLoad
function gg:async/start
