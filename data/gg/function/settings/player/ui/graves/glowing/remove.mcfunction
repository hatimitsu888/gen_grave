#> gg:settings/player/ui/graves/glowing/remove
# お墓の発光を解除する

# プレイヤーのidを取得
execute store result storage gg_tmp: id.player int 1 run scoreboard players get @s gg.id.player

# プレイヤーの情報を取得
function gg:common/player/fetch_data with storage gg_tmp: id

# 発光を解除する
execute on passengers if entity @s[tag=gg-head] run data modify entity @s Glowing set value false
execute on passengers if entity @s[tag=gg-base] run data modify entity @s Glowing set value false

# チャンクロード解除
data modify storage gg_tmp: chunkLoad set from storage gg_tmp: player.tmp.chunkLoads.glowing
function gg:common/unload with storage gg_tmp: chunkLoad

# 情報を削除
data remove storage gg_tmp: player.tmp.chunkLoads.glowing
function gg:common/player/set_tmp with storage gg_tmp: id

# aecを削除
execute on passengers if entity @s[tag=gg-glowing] run kill @s
