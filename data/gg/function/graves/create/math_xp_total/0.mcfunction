#> gg:graves/create/math_xp_total/0
# レベル16以下

# 宣言
scoreboard players set #tmp.a gg.math 6
scoreboard players operation #tmp.C gg.math = #tmp.A gg.math

# 計算
# level^2 + 6 * level + points
scoreboard players operation #tmp.C gg.math *= #tmp.C gg.math
scoreboard players operation #tmp.A gg.math *= #tmp.a gg.math
scoreboard players operation #tmp.A gg.math += #tmp.C gg.math
scoreboard players operation #tmp.A gg.math += #tmp.B gg.math

# 保存
execute store result storage gg_tmp: grave.xp.total int 1 run scoreboard players get #tmp.A gg.math

# リセット
scoreboard players reset #tmp.a gg.math
scoreboard players reset #tmp.C gg.math
