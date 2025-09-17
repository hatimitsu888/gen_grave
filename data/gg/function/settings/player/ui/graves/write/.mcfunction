#> gg:settings/player/ui/graves/write/
# 整理

# 位置を整数に
execute store result storage gg_common:dialog label.x int 1 run data get storage gg_tmp: grave.pos[0] 1
execute store result storage gg_common:dialog label.y int 1 run data get storage gg_tmp: grave.pos[1] 1
execute store result storage gg_common:dialog label.z int 1 run data get storage gg_tmp: grave.pos[2] 1

# ディメンションを取り出す
data modify storage gg_common:dialog label.dimension set from storage gg_tmp: grave.dimension

# 書き出し
function gg:settings/player/ui/graves/write/write with storage gg_common:dialog label
