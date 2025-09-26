#> gg:common:grave/delete/kill
# お墓を削除する

# 発光中だったら
execute on passengers if entity @s[tag=gg-glowing] run function gg:common/grave/delete/glowing
# キル
execute on passengers run kill @s[tag=gg-grave]
kill @s
