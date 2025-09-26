#> gg:settings/player/ui/graves/tp/
# お墓にテレポート

# ダイアログを消す
dialog clear @s

# テレポートできない
execute if data storage gg_common:world_settings {tpGrave: false} run return run tellraw @s {text:"お墓へのテレポートが許可されていません。", color:"red"}

# プレイヤーの情報を取り出す
function gg:common/player/fetch_data with storage gg_tmp: id

# トリガーをidに変換
scoreboard players operation #tmp.A gg.math = @s gg.playerSetting
scoreboard players remove #tmp.A gg.math 14000

# お墓の情報を取り出す
execute store result storage gg_tmp: id.grave int 1 run scoreboard players get #tmp.A gg.math
function gg:common/grave/fetch_data with storage gg_tmp: id

# リセット
scoreboard players reset #tmp.A gg.math


# テレポートするための情報を取り出す
data modify storage gg_tmp: teleport.x set from storage gg_tmp: grave.pos[0]
data modify storage gg_tmp: teleport.y set from storage gg_tmp: grave.pos[1]
data modify storage gg_tmp: teleport.z set from storage gg_tmp: grave.pos[2]
data modify storage gg_tmp: teleport.dimension set from storage gg_tmp: grave.dimension

# テレポート
function gg:settings/player/ui/graves/tp/teleport with storage gg_tmp: teleport
