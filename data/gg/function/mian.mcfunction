#> gg:main
# 常時実行する関数

# AECが消える
execute as @e[type=area_effect_cloud, tag=gg-glowing, predicate=gg:aec_timer] on vehicle at @s run function gg:settings/player/ui/graves/glowing/remove
