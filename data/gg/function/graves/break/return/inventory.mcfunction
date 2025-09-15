#> gg:graves/break/return/inventory
# 取り出す準備

# スコアをストレージに
execute store result storage gg_tmp: dropItems.index int 1 run scoreboard players get #tmp.A gg.math

# 取り出す
function gg:graves/break/return/get with storage gg_tmp: dropItems

# スコアを繰り上げ
scoreboard players add #tmp.A gg.math 1

# 再帰
execute if score #tmp.A gg.math matches ..35 run function gg:graves/break/return/inventory
