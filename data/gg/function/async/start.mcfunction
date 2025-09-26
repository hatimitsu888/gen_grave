#> gg:async/start
# 非同期処理を開始する

# 既に実行中ならこの処理は中断
execute if data storage gg_async: {nowRunning: true} run return fail

# 実行中のフラグを立てる
data modify storage gg_async: nowRunning set value true

# 開始
function gg:async/
