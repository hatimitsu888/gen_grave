#> gg:settings/player/ui/graves/grave/check
# お墓が存在しているか確認する

# お墓のidに変換
scoreboard players set #tmp.A gg.math 1000
scoreboard players operation #tmp.A gg.id.grave = @s gg.playerSetting
scoreboard players operation #tmp.A gg.id.grave %= #tmp.A gg.math
execute store result storage gg_tmp: id.grave int 1 run scoreboard players get #tmp.A gg.id.grave
scoreboard players reset #tmp.A gg.id.grave
scoreboard players reset #tmp.A gg.math

# 存在を確認する
return run function gg:settings/player/ui/graves/grave/search_grave with storage gg_tmp: id
