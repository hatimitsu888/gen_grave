#> gg:graves/create/math_xp_total/2
# レベル32以上

# 宣言
scoreboard players set #tmp.a gg.math 10
scoreboard players set #tmp.b gg.math 45
scoreboard players set #tmp.c gg.math 1625
scoreboard players operation #tmp.C gg.math = #tmp.A gg.math

# 計算
# 4.5 * level^2 - 162.5 * level + 2220 + points
scoreboard players operation #tmp.C gg.math *= #tmp.C gg.math
scoreboard players operation #tmp.C gg.math *= #tmp.b gg.math
scoreboard players operation #tmp.A gg.math *= #tmp.c gg.math
scoreboard players operation #tmp.C gg.math -= #tmp.A gg.math
scoreboard players operation #tmp.C gg.math /= #tmp.a gg.math
scoreboard players add #tmp.C gg.math 2220
scoreboard players operation #tmp.C gg.math += #tmp.B gg.math

# 保存
execute store result storage gg_tmp: grave.xp.total int 1 run scoreboard players get #tmp.C gg.math

# リセット
scoreboard players reset #tmp.a gg.math
scoreboard players reset #tmp.b gg.math
scoreboard players reset #tmp.c gg.math
scoreboard players reset #tmp.C gg.math
