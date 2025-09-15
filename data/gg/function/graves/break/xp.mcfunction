#> gg:graves/break/xp
# お墓が壊れる

# 保持しない
$execute if data storage gg_common:world_settings {keepExp:false} run xp add @s $(result) points

# 保持する
$execute if data storage gg_common:world_settings {keepExp:true} run xp add @s $(total) points
