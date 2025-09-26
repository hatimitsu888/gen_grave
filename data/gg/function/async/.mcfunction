#> gg:async/
# 非同期処理

# 内容を確認
data modify storage gg_async: tmpProcesses set from storage gg_async: processes
execute if data storage gg_async: processes[0] run function gg:async/check

# 処理が終わっていたら中断
execute unless data storage gg_async: processes[0] run return run data modify storage gg_async: nowRunning set value false

# 再帰
schedule function gg:async/ 5t replace
