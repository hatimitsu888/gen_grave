#> gg:graves/create/math_xp
# 経験値の計算

# 宣言
scoreboard players set #tmp.A gg.math 7

# 経験値を代入
execute store result score #tmp.B gg.math run data get storage gg_tmp: grave.xp.levels

# 経験値を掛け算
scoreboard players operation #tmp.B gg.math *= #tmp.A gg.math

# 100以上なら切り捨て
execute if score #tmp.B gg.math matches 101.. run scoreboard players set #tmp.B gg.math 100

# 結果を代入
execute store result storage gg_tmp: grave.xp.result int 1 run scoreboard players get #tmp.B gg.math

# 初期化
scoreboard players reset #tmp.A
scoreboard players reset #tmp.B
