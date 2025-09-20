#> gg:common:unload
# 位置とディメンションの情報からチャンクロードを解除する

# チャンクがもともとロードされていたら解除しない
$execute if data storage gg_tmp: {chunkLoad:{isAlreadyLoaded: 0b}} in $(dimension) run forceload remove $(x) $(z)
