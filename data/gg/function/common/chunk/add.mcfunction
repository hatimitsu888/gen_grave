#> gg:common/chunk/add
# チャンクのロード情報を追加する

# ロード状況を確認する
function gg:common/chunk/check/chunkload
function gg:common/chunk/check/dataexist

# 読み込まれていてデータとして存在していない場合は中断
execute if data storage gg_chunks: {flags:{dataAlreadyExists:0b, chunkAlreadyLoading:1b}} run return run function gg:common/chunk/reset


# 読み込まれておらずデータとして存在していない場合は作成してチャンク読み込み
execute if data storage gg_chunks: {flags:{dataAlreadyExists:0b, chunkAlreadyLoading:0b}} run function gg:common/chunk/create

# 処理を追加
data modify storage gg_chunks: loadingChunks[{this:1b}].count append value ""

# 指定を解除
data modify storage gg_chunks: loadingChunks[{this:1b}].this set value 0b


# リセット
function gg:common/chunk/reset
