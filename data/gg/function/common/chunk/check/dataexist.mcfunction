#> gg:common/chunk/check/dataexist
# チャンクのデータを確認する

# 情報を取り出す
execute store result storage gg_chunks: tmp.pos.x int 1 run data get storage gg_chunks: set.pos[0] 0.0625
execute store result storage gg_chunks: tmp.pos.z int 1 run data get storage gg_chunks: set.pos[2] 0.0625
data modify storage gg_chunks: tmp.pos.dimension set from storage gg_chunks: set.dimension

# チャンクの情報がストレージ上ですでに存在しているかどうかをチェックする
function gg:common/chunk/check/data with storage gg_chunks: tmp.pos
