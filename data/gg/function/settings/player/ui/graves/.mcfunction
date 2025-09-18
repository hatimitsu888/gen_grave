#> gg:settings/player/ui/graves/
# お墓の情報を整理してダイアログに書き出す

# スペクテイターモードでは確認不可
execute if entity @s[gamemode=spectator] run return run tellraw @s {text: "スペクテイターモードでお墓を確認することはできません！", color: "red"}

# リセット
data modify storage gg_common:dialog graves set value {actions:[], new:'{"text":"[新しい]", "color":"dark_gray", "click_event":{"action":"run_command", "command":"trigger gg.playerSetting set 10"}, "hover_event":{"action":"show_text", "value":"新しい順に並べ替え"}}', old:'{"text":"[古い]", "color":"dark_gray", "click_event":{"action":"run_command", "command":"trigger gg.playerSetting set 11"}, "hover_event":{"action":"show_text", "value":"古い順に並べ替え"}}'}
data remove storage gg_common:dialog graves.actions

# 表示順
execute if score @s gg.playerSetting matches 10 run data modify storage gg_common:dialog graves.new set value '{"text": "[新しい]","color": "green"}'
execute if score @s gg.playerSetting matches 11 run data modify storage gg_common:dialog graves.old set value '{"text": "[古い]","color": "green"}'

# プレイヤーの情報を取得
execute store result storage gg_tmp: id.player int 1 run scoreboard players get @s gg.id.player
function gg:common/player/fetch_data with storage gg_tmp: id

# お墓をすべて取得
data modify storage gg_tmp: graves set from storage gg_tmp: player.graves

# お墓が存在していなかったら中断
execute unless data storage gg_tmp: graves[0] run return run tellraw @s {text:"お墓が1つも存在していません。", color:"gray"}

# 新しい順
execute if score @s gg.playerSetting matches 10 run function gg:settings/player/ui/graves/write/new

# 古い順
execute if score @s gg.playerSetting matches 11 run function gg:settings/player/ui/graves/write/old

# ダイアログを開く
function gg:settings/player/ui/graves/dialog with storage gg_common:dialog graves
