#> gg:common:grave/load
# 位置とディメンションの情報からお墓を読み込む

# すでにチャンクがロードされている
$execute store success storage gg_tmp: graveLoad.isAlreadyLoaded byte 1 run forceload query $(x) $(z)

# チャンクをロード
$execute in $(dimension) run forceload add $(x) $(z)
