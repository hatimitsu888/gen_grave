#> gg:settings/player/default/delete_old_player_data
# idを初期化した際に、過去のプレイヤーデータを消去する

# idを一時保存
execute if score @s gg.id.player matches -2147483648..2147483647 store result storage gg_common:func_option playerSettings.tmpId int 1 run scoreboard players get @s gg.id.player

# 一致するお墓を消去する
function gg:common/player/delete_player_data with storage gg_common:func_option playerSettings
