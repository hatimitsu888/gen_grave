#> #> gg:settings/player/ui/graves/glowing/set
# 発光

# 頭
execute on passengers if entity @s[tag=gg-head] run data modify entity @s Glowing set value true

# 土台
execute on passengers if entity @s[tag=gg-base] run data modify entity @s Glowing set value true
