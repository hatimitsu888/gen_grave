#> gg:common/chunk/check/chunkload
# チャンクのロード情報を確認する

# 情報を取り出す
execute store result storage gg_chunks: load.x int 1 run data get storage gg_chunks: set.pos[0] 1
execute store result storage gg_chunks: load.z int 1 run data get storage gg_chunks: set.pos[2] 1
data modify storage gg_chunks: load.dimension set from storage gg_chunks: set.dimension

# 既にチャンクが読み込まれているか
function gg:common/chunk/check/loaded with storage gg_chunks: load
