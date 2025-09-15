#> gg:graves/create/math_xp_total/
# 総経験値量の計算

# 経験値をスコアに
execute store result score #tmp.A gg.math run data get storage gg_tmp: grave.xp.levels
execute store result score #tmp.B gg.math run data get storage gg_tmp: grave.xp.points

# 比較用
scoreboard players operation #tmp.I gg.math = #tmp.A gg.math

# レベルによって計算式が変わる
execute if score #tmp.I gg.math matches ..16 run function gg:graves/create/math_xp_total/0
execute if score #tmp.I gg.math matches 17..31 run function gg:graves/create/math_xp_total/1
execute if score #tmp.I gg.math matches 32.. run function gg:graves/create/math_xp_total/2

# リセット
scoreboard players reset #tmp.A gg.math
scoreboard players reset #tmp.B gg.math
scoreboard players reset #tmp.I gg.math
