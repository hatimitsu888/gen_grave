#> gg:common/chunk/unload
# チャンクのロードを解除する

# データを削除
data remove storage gg_chunks: loadingChunks[{this:1b}]

# 情報を取り出す
execute store result storage gg_chunks: load.x int 1 run data get storage gg_chunks: set.pos[0] 1
execute store result storage gg_chunks: load.z int 1 run data get storage gg_chunks: set.pos[2] 1
data modify storage gg_chunks: load.dimension set from storage gg_chunks: set.dimension

# アンロード
function gg:common/chunk/load/unload with storage gg_chunks: load
