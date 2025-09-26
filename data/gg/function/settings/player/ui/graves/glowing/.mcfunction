#> gg:settings/player/ui/graves/glowing/
# お墓を発光させる

# ダイアログを閉じる
dialog clear @s

# プレイヤーの情報を取得
function gg:common/player/fetch_data with storage gg_tmp: id


# プレイヤーのidを保存
scoreboard players operation #tmp.A gg.id.player = @s gg.id.player

# 発光中のお墓が存在していたら
execute if data storage gg_tmp: player.tmp.chunkLoads.glowing as @e[type=area_effect_cloud, tag=gg-glowing] on vehicle if score @s gg.id.player = #tmp.A gg.id.player at @s run function gg:settings/player/ui/graves/glowing/remove

# リセット
scoreboard players reset #tmp.A gg.id.player


# お墓のidを取得
scoreboard players operation #tmp.A gg.math = @s gg.playerSetting
scoreboard players remove #tmp.A gg.math 15000

# お墓の情報を取得
execute store result storage gg_tmp: id.grave int 1 run scoreboard players get #tmp.A gg.math
function gg:common/grave/fetch_data with storage gg_tmp: id

# リセット
scoreboard players reset #tmp.A gg.math


# 位置情報をセット
data modify storage gg_chunks: set.pos set from storage gg_tmp: grave.pos
data modify storage gg_chunks: set.dimension set from storage gg_tmp: grave.dimension

# チャンク情報を保存
data modify storage gg_tmp: player.tmp.chunkLoads.glowing set from storage gg_chunks: set
function gg:common/player/set_tmp with storage gg_tmp: id

# チャンクを読み込む
function gg:common/chunk/add


# お墓が読み込まれていたらそのまま実行
execute store result storage gg_tmp: loaded.pos.x int 1 run data get storage gg_tmp: grave.pos[0] 1
execute store result storage gg_tmp: loaded.pos.y int 1 run data get storage gg_tmp: grave.pos[1] 1
execute store result storage gg_tmp: loaded.pos.z int 1 run data get storage gg_tmp: grave.pos[2] 1
data modify storage gg_tmp: loaded.pos.dimension set from storage gg_tmp: grave.dimension
function gg:common/loaded with storage gg_tmp: loaded.pos
execute if data storage gg_tmp: {loaded:{isLoaded:1b}} run return run function gg:settings/player/ui/graves/glowing/glow

# 非同期処理を開始
data modify storage gg_async: processes append value {id:"glowing", pass:{pId:-1, gId:-1}, chunk:{x:0, y:0, z:0, dimension: ""}}
data modify storage gg_async: processes[-1].pass.pId set from storage gg_tmp: id.player
data modify storage gg_async: processes[-1].pass.gId set from storage gg_tmp: id.grave
data modify storage gg_async: processes[-1].chunk set from storage gg_tmp: loaded.pos
function gg:async/start
