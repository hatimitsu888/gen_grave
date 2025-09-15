#> gg:graves/create/insert_data
# データを挿入する

# idが一致しているデータが存在するか
$execute unless data storage gg_player: players[{id: $(player)}] run return 100

# お墓を保存
$data modify storage gg_player: players[{id: $(player)}].graves append from storage gg_tmp: grave

# 保存してあるお墓の数を数える
$execute store result score #tmp.A gg.math if data storage gg_player: players[{id: $(player)}].graves[]

# 保存上限を取得
execute store result score #tmp.B gg.math run data get storage gg_common:world_settings graveMax

# 保存上限を超えていたら、古いものを消去する
execute if score #tmp.A gg.math > #tmp.B gg.math run function gg:graves/create/delete_over with storage gg_tmp: id

# リセット
scoreboard players reset #tmp.A gg.math
scoreboard players reset #tmp.B gg.math
