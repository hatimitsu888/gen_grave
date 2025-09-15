#> gg:common/grave/fetch_data
# お墓のデータを取り出す

# ストレージに代入
$data modify storage gg_tmp: grave set from storage gg_tmp: player.graves[{id: $(grave)}]
