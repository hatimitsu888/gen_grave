#> gg:settings/player/ui/graves/glowing/glow
# 読み込みが確認出来たらお墓を発光させる

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

# 移動
tp @n[distance=..1, tag=gg-init, tag=gg-glowing] @n[type=text_display ,tag=gg-thisCore]

# コアに乗せる
ride @n[tag=gg-init, tag=gg-glowing] mount @n[type=text_display ,tag=gg-thisCore]

# タグ削除
tag @n[type=area_effect_cloud, tag=gg-init, tag=gg-glowing] remove gg-init


# 発光
execute as @n[type=text_display, tag=gg-thisCore] at @s run function gg:settings/player/ui/graves/glowing/set


# タグ削除
tag @n[type=text_display, tag=gg-thisCore] remove gg-thisCore
