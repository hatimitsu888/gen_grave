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

# チャンクを読み込む
execute store result storage gg_tmp: chunkLoad.x int 1 run data get storage gg_tmp: grave.pos[0] 1
execute store result storage gg_tmp: chunkLoad.z int 1 run data get storage gg_tmp: grave.pos[2] 1
execute store result storage gg_tmp: chunkLoad.dimension int 1 run data get storage gg_tmp: grave.dimension 1
function gg:common/load with storage gg_tmp: id

# チャンク情報を保存
data modify storage gg_tmp: player.tmp.chunkLoads.glowing set from storage gg_tmp: chunkLoad
function gg:common/player/set_tmp with storage gg_tmp: id

# idをスコアに
execute store result score #tmp.A gg.id.player run data get storage gg_tmp: id.player
execute store result score #tmp.A gg.id.grave run data get storage gg_tmp: id.grave

# お墓を特定
execute as @e[type=text_display, tag=gg-core] if score @s gg.id.player = #tmp.A gg.id.player if score @s gg.id.grave = #tmp.A gg.id.grave run tag @s add gg-thisCore

# リセット
scoreboard players reset #tmp.A gg.id.player
scoreboard players reset #tmp.A gg.id.grave


# AECを召喚
#### AgeとDurationには1秒ほどの遅延があるらしいので、Durationは1秒少なく書く。
summon area_effect_cloud ~ ~ ~ {Tags:["gg-init","gg-glowing"], Age:0, Duration:380, Radius:0f}

# コアに乗せる
ride @n[distance=..1, tag=gg-init, tag=gg-glowing] mount @n[type=text_display ,tag=gg-thisCore]

# タグ削除
tag @n[type=area_effect_cloud, tag=gg-init, tag=gg-glowing] remove gg-init


# 発光
execute as @n[type=text_display, tag=gg-thisCore] at @s run function gg:settings/player/ui/graves/glowing/set


# タグ削除
tag @n[type=text_display, tag=gg-thisCore] remove gg-thisCore
