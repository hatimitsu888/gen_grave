#> gg:settings/player/ui/graves/glowing/async
# 非同期で実行される

# idを保存
data modify storage gg_tmp: id.player set from storage gg_async: tmp.pass.pId
data modify storage gg_tmp: id.grave set from storage gg_async: tmp.pass.gId

# 発光
function gg:settings/player/ui/graves/glowing/glow
