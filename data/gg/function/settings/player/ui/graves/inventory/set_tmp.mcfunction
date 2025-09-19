#> gg:settings/player/ui/graves/inventory/set_tmp
# プレイヤーのストレージに保存する

$data modify storage gg_player: players[{id:$(player)}].tmp set from storage gg_tmp: player.tmp
