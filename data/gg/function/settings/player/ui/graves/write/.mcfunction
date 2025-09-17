#> gg:settings/player/ui/graves/write/
# 整理

# お墓のidを取得
execute store result score #tmp.A gg.math run data get storage gg_tmp: grave.id 1

# idをトリガーに変換
scoreboard players set #tmp.B gg.math 20000
scoreboard players operation #tmp.B gg.math += #tmp.A gg.math
execute store result storage gg_common:dialog label.trigger int 1 run scoreboard players get #tmp.B gg.math

# リセット
scoreboard players reset #tmp.A gg.math
scoreboard players reset #tmp.B gg.math

# 位置を整数に
execute store result storage gg_common:dialog label.x int 1 run data get storage gg_tmp: grave.pos[0] 1
execute store result storage gg_common:dialog label.y int 1 run data get storage gg_tmp: grave.pos[1] 1
execute store result storage gg_common:dialog label.z int 1 run data get storage gg_tmp: grave.pos[2] 1

# ディメンションを取り出す
data modify storage gg_common:dialog label.dimension set from storage gg_tmp: grave.dimension

# 書き出し
function gg:settings/player/ui/graves/write/write with storage gg_common:dialog label
