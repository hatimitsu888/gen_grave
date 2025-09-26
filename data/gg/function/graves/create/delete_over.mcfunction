#> gg:graves/create/delete_over
# 保存上限を超えていたら

# 一番古いお墓のidを取り出す
$data modify storage gg_tmp: id.grave set from storage gg_player: players[{id:$(player)}].graves[0].id

# そのお墓を消去する
function gg:common/grave/delete/

# 減算
scoreboard players remove #tmp.A gg.math 1

# 再起
execute if score #tmp.A gg.math > #tmp.B gg.math run function gg:graves/create/delete_over with storage gg_tmp: id
