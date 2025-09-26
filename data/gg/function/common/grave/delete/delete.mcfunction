#> gg:common:grave/delete/delete
# お墓を削除する

# idをスコアに変換
execute store result score #tmp.A gg.id.player run data get storage gg_tmp: id.player
execute store result score #tmp.A gg.id.grave run data get storage gg_tmp: id.grave

# お墓を消去
execute as @e[type=text_display, tag=gg-core] if score @s gg.id.player = #tmp.A gg.id.player if score @s gg.id.grave = #tmp.A gg.id.grave run function gg:common/grave/delete/kill

# リセット
scoreboard players reset #tmp.A gg.id.player
scoreboard players reset #tmp.A gg.id.grave

# お墓の位置をアンロード
function gg:common/unload with storage gg_tmp: chunkLoad


# データを消去
function gg:common/grave/delete/delete_grave_data with storage gg_tmp: id
