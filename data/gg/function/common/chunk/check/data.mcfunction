#> gg:common/chunk/check/data
# チャンクデータがすでに存在するか確認

# ストレージのチャンク情報を確認し、データが存在していればフラグを立てる
$execute store success storage gg_chunks: flags.dataAlreadyExists byte 1 if data storage gg_chunks: loadingChunks[{pos:{x:$(x), z:$(z), dimension:"$(dimension)"}}]

$execute if data storage gg_chunks: {flags:{dataAlreadyExists:1b}} run data modify storage gg_chunks: loadingChunks[{pos:{x:$(x), z:$(z), dimension:"$(dimension)"}}].this set value 1b
