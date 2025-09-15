#> gg:settings/player/default/check_player_id
# idが一致するお墓が存在するか確認

# 一致なら上書き
$execute if data storage gg_player: players[{id: $(tmpId)}] run return run data modify storage gg_player: players[{id: $(tmpId)}] merge from storage gg_tmp: playerTmp

# 不一致なら新規作成
data modify storage gg_player: players append from storage gg_tmp: playerTmp
