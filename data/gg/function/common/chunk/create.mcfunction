#> gg:common/chunk/create
# チャンク情報が無ければ作成

# 初期設定
data modify storage gg_chunks: loadingChunks append value {pos:{x:0, z:0, dimension:""}, count:[], this:1b}

# 位置を保存
data modify storage gg_chunks: loadingChunks[{this:1b}].pos set from storage gg_chunks: tmp.pos

# チャンクをロードする
function gg:common/chunk/load/load with storage gg_chunks: load
