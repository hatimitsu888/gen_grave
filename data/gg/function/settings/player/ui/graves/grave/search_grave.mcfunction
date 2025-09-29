#> gg:settings/player/ui/graves/grave/search_grave
# お墓が存在しているか確認する

$return run execute if data storage gg_player: players[{id:$(player)}].graves[{id:$(grave)}]
