#> gg:common:grave/loaded
# チャンクがロードされているか

$execute in $(dimension) store success storage gg_tmp: loaded.isLoaded byte 1 if loaded $(x) $(y) $(z)
