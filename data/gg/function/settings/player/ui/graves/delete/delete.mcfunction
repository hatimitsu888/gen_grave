#> gg:settings/player/ui/graves/delete/delete
# 削除する

# お墓のidを取得する
scoreboard players operation #tmp.A gg.math = @s gg.playerSetting
scoreboard players remove #tmp.A gg.math 19000
execute store result storage gg_tmp: id.grave int 1 run scoreboard players get #tmp.A gg.math
scoreboard players reset #tmp.A gg.math

# お墓を削除する
function gg:common/grave/delete/

# 一覧に戻る
scoreboard players set @s gg.playerSetting 10
function gg:settings/player/ui/graves/
