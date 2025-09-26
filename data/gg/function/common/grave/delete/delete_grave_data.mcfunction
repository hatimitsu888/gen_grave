#> gg:common:grave/delete/delete_grave_data
# プレイヤーとお墓のidから特定のお墓のデータを削除する

$data remove storage gg_player: players[{id:$(player)}].graves[{id:$(grave)}]
