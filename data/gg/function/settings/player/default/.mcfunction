#> gg:settings/player/default/
# プレイヤー設定のデフォルト

# ストレージをリセット
data remove storage gg_player: tmp

# 初期設定
data modify storage gg_player: tmp.settings.othersBreaking set value true
data modify storage gg_player: tmp.settings.visibles.items set value true
data modify storage gg_player: tmp.settings.visibles.exp set value true

# idをリセットする(オプション)
execute if data storage gg_common:func_option {playerSettings:{resetId: true}} run function gg:settings/player/default/reset_id

# idをセットする
execute store result storage gg_player: tmp.id int 1 run scoreboard players get @s gg.id.player

# お墓をリセットする(オプション)
execute if data storage gg_common:func_option {playerSettings:{resetGraves: true}} run function gg:settings/player/default/reset_graves

# 現在設定されてるidと同じお墓があるなら上書き
execute store result storage gg_common:func_option playerSettings.tmpId int 1 run scoreboard players get @s gg.id.player
function gg:settings/player/default/check_player_id with storage gg_common:func_option playerSettings

# 設定をリセットする
data modify storage gg_common:func_option playerSettings set value {\
    resetId: false, \
    deletePlayerData: false, \
    resetGraves: false, \
    tmpId: -1\
}
