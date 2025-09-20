#> gg:common:grave/kill
# お墓を削除する

# 発光中だったら
execute on passengers if entity @s[tag=gg-glowing] run data remove storage gg_tmp: player.tmp.chunkLoads.glowing

# キル
execute on passengers run kill @s[tag=gg-grave]
kill @s
