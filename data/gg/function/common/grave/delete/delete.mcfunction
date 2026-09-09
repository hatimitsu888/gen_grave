#> gg:common:grave/delete/delete
# お墓を削除する

# idをスコアに変換
execute store result score #tmp.A gg.id.player run data get storage gg_tmp: id.player
execute store result score #tmp.A gg.id.grave run data get storage gg_tmp: id.grave

# お墓を消去
execute as @e[type=text_display, tag=gg-core] if score @s gg.id.player = #tmp.A gg.id.player if score @s gg.id.grave = #tmp.A gg.id.grave run function gg:common/grave/delete/kill

# 位置情報をセット
data modify storage gg_chunks: set.pos set from storage gg_tmp: grave.pos
data modify storage gg_chunks: set.dimension set from storage gg_tmp: grave.dimension

# お墓の位置をアンロード
function gg:common/chunk/remove

# データを消去
function gg:common/grave/delete/delete_grave_data with storage gg_tmp: id

# 削除フラグが立っていたらダイアログを開きなおす
execute if data storage gg_tmp: player.tmp{deleteNow:true} as @a if score @s gg.id.player = #tmp.A gg.id.player at @s run function gg:settings/player/ui/graves/delete/show_list

# リセット
scoreboard players reset #tmp.A gg.id.player
scoreboard players reset #tmp.A gg.id.grave
