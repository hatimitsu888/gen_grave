#> gg:graves/break/click/transformation
# お墓の状態を変える

execute if score @s gg.clickCount matches 4 on passengers if entity @s[tag=gg-head] run data modify entity @s transformation merge value {left_rotation:[0.2566f, 0.0338f, 0.1261f, 0.9577f],translation:[-0.05f,0.38f,0.15f]}
execute if score @s gg.clickCount matches 3 on passengers if entity @s[tag=gg-head] run data modify entity @s transformation merge value {left_rotation:[0.126f, -0.099f, -0.2391f, 0.9577f],translation:[0.1f,0.32f,0.08f]}
execute if score @s gg.clickCount matches 2 on passengers if entity @s[tag=gg-head] run data modify entity @s transformation merge value {left_rotation:[0.3545f, 0.1102f, 0.1044f, 0.9227f],translation:[0f,0.23f,0.2f]}
execute if score @s gg.clickCount matches 1 on passengers if entity @s[tag=gg-head] run data modify entity @s transformation merge value {left_rotation:[0.2479f, -0.1295f, -0.357f, 0.8912f],translation:[0.15f,0.05f,0.08f]}
