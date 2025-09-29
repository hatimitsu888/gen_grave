#> gg:common:grave/delete/glowing
# 発光中だったら

# チャンクのロードを解除
data modify storage gg_chunks: set set from storage gg_tmp: player.tmp.chunkLoads.glowing
function gg:common/chunk/remove

# データを削除
data remove storage gg_tmp: player.tmp.chunkLoads.glowing

# 情報を保存
function gg:common/player/set_tmp with storage gg_tmp: id
