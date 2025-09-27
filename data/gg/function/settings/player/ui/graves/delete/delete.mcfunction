#> gg:settings/player/ui/graves/delete/delete
# 削除する

# 待機
dialog show @s gg:wait

# プレイヤーの情報を取得する
function gg:common/player/fetch_data with storage gg_tmp: id

# プレイヤーに情報を保存しておく
data modify storage gg_tmp: player.tmp.deleteNow set value true
function gg:common/player/set_tmp with storage gg_tmp: id


# お墓のidを取得する
scoreboard players operation #tmp.A gg.math = @s gg.playerSetting
scoreboard players remove #tmp.A gg.math 19000
execute store result storage gg_tmp: id.grave int 1 run scoreboard players get #tmp.A gg.math
scoreboard players reset #tmp.A gg.math

# お墓を削除する
function gg:common/grave/delete/
