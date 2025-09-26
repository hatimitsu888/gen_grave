#> gg:async/run
# 処理を実行

# 待機中の処理を消去
data remove storage gg_async: processes[0]

# 発光
execute if data storage gg_async: {tmp:{id:"glowing"}} run function gg:settings/player/ui/graves/glowing/async
