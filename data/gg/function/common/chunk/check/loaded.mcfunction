#> gg:common/chunk/check/loaded
# チャンクがすでに読み込まれているか確認

$execute in $(dimension) store success storage gg_chunks: flags.chunkAlreadyLoading byte 1 run forceload query $(x) $(z)
