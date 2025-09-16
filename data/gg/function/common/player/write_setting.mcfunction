#> gg:common/player/write_setting
# プレイヤーの設定を変更する

$data modify storage gg_player: players[{id:$(player)}].settings set from storage gg_tmp: player.settings
