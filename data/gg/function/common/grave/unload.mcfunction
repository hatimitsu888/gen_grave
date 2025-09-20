#> gg:common:grave/unload
# 位置とディメンションの情報からお墓の読み込みを解除する

# チャンクがもともとロードされていたら解除しない
$execute if data storage gg_tmp: {graveLoad:{isAlreadyLoaded: 0b}} in $(dimension) run forceload remove $(x) $(z)
