#> gg:common:grave/delete
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

# idをスコアに変換
execute store result score #tmp.A gg.id.player run data get storage gg_tmp: id.player
execute store result score #tmp.A gg.id.grave run data get storage gg_tmp: id.grave

# お墓を消去
execute as @e[type=text_display, tag=gg-core] if score @s gg.id.player = #tmp.A gg.id.player if score @s gg.id.grave = #tmp.A gg.id.grave run function gg:common/grave/kill

# リセット
scoreboard players reset #tmp.A gg.id.player
scoreboard players reset #tmp.A gg.id.grave

# お墓の位置をアンロード
function gg:common/unload with storage gg_tmp: chunkLoad


# データを消去
function gg:common/grave/delete_grave_data with storage gg_tmp: id
