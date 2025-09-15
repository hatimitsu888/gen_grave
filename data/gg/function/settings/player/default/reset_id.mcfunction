#> gg:settings/player/default/reset_id
# idをリセットする

# リセット前の過去のプレイヤーデータを消去(オプション)
execute if data storage gg_common:func_option {playerSettings:{deletePlayerData: true}} run function gg:settings/player/default/delete_old_player_data

# idを設定
scoreboard players operation @s gg.id.player = #maxPlayerId gg.id.player

# idを加算
scoreboard players add #maxPlayerId gg.id.player 1
