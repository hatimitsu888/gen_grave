#> gg:settings/player/ui/graves/inventory/origin
# インベントリを元に戻す

# マネキンを特定
scoreboard players operation #tmp.A gg.math = @s gg.id.player
execute as @e[type=minecraft:mannequin,tag=gg-inv] if score @s gg.id.player = #tmp.A gg.math run tag @s add gg-thisMnq
scoreboard players reset #tmp.A gg.math

# プレイヤーidを取得
execute store result storage gg_tmp: id.player int 1 run scoreboard players get @s gg.id.player

# プレイヤーの情報を取得
function gg:common/player/fetch_data with storage gg_tmp: id

# インベントリを削除
clear @s

# 元のインベントリをセット
data modify storage gg_tmp: dropItems.inventory set from storage gg_tmp: player.tmp.origin.inventory
data modify storage gg_tmp: dropItems.equipment set from storage gg_tmp: player.tmp.origin.equipment

# 戻す
function gg:settings/player/ui/graves/inventory/return/

# モードを戻す
execute if data storage gg_tmp: {player:{tmp:{gamemode:0}}} run gamemode survival @s
execute if data storage gg_tmp: {player:{tmp:{gamemode:1}}} run gamemode creative @s
execute if data storage gg_tmp: {player:{tmp:{gamemode:2}}} run gamemode adventure @s

# マネキンにtp
tp @s @n[type=minecraft:mannequin,tag=gg-thisMnq]

# マネキンをキル
tp @n[type=minecraft:mannequin,tag=gg-thisMnq] ~ ~-1000 ~

# タグを消去
tag @s remove gg-checkInv

# もとのダイアログを開きなおす
execute store result score @s gg.playerSetting run data get storage gg_tmp: player.tmp.graveId 1
execute if data storage gg_tmp: {player:{tmp:{before:"list"}}} run scoreboard players set @s gg.playerSetting 10
execute if data storage gg_tmp: {player:{tmp:{before:"detail"}}} run scoreboard players add @s gg.playerSetting 10000
