#> gg:common/chunk/remove
# チャンクのロード情報を削除する

# ロード状況を確認する
function gg:common/chunk/check/dataexist

# ロード情報が見つからなければ中断
execute if data storage gg_chunks: {flags:{dataAlreadyExists:0b}} run return run function gg:common/chunk/reset


# 処理をひとつ削除
data remove storage gg_chunks: loadingChunks[{this:1b}].count[0]

# 処理中の項目がゼロだったら読み込みを解除
execute unless data storage gg_chunks: loadingChunks[{this:1b}].count[0] run function gg:common/chunk/unload

# 指定を解除
execute if data storage gg_chunks: loadingChunks[{this:1b}].count[0] run data modify storage gg_chunks: loadingChunks[{this:1b}].this set value 0b


# リセット
function gg:common/chunk/reset
