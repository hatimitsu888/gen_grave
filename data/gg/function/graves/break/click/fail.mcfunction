#> gg:graves/break/click/fail
# 壊せない

tellraw @p[tag=gg-this] {text:"このお墓を壊すことはできません。", color:gray}
execute as @p[tag=gg-this] at @s run playsound block.note_block.bass ui @s
execute at @s run particle minecraft:dust{color:[0.3, 0.3, 0.3], scale:0.8} ~ ~0.5 ~ 0.2 0.2 0.2 1 10 normal
