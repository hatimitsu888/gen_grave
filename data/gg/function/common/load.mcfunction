#> gg:common:grave/load
# 位置とディメンションの情報からチャンクロード

# すでにチャンクがロードされている
$execute in $(dimension) store success storage gg_tmp: chunkLoad.isAlreadyLoaded byte 1 run forceload query $(x) $(z)

# チャンクをロード
$execute in $(dimension) run forceload add $(x) $(z)
