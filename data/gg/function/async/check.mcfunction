#> gg:async/check
# 処理内容を確認する

# 中身を取り出す
data modify storage gg_async: tmp set from storage gg_async: tmpProcesses[0]

# チャンクが読み込まれているか確認
function gg:async/loaded with storage gg_async: tmp.chunk

# 読み込まれた
execute if data storage gg_async: {isLoaded: 1b} run function gg:async/run

# 消去
data remove storage gg_async: tmpProcesses[0]
data remove storage gg_async: tmp

# 再帰
execute if data storage gg_async: tmpProcesses[0] run function gg:async/check
