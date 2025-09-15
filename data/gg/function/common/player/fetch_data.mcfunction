#> gg:common/player/fetch_data
# プレイヤーのデータを取り出す

# ストレージに代入
$data modify storage gg_tmp: player set from storage gg_player: players[{id: $(player)}]
