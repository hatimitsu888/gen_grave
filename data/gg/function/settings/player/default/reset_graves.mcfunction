#> gg:settings/player/default/reset_graves
# お墓の情報を初期化する

# データを初期化
data modify storage gg_tmp: player.graves set value []

# idを初期化
scoreboard players set @s gg.id.grave 0
