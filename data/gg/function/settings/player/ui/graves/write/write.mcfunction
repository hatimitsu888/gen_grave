#> gg:settings/player/ui/graves/write/write
# 書き出し

# 追加
$data modify storage gg_common:dialog graves.actions append value {"label":{"text":"X:$(x) Y:$(y) Z:$(z)    [$(dimension)]"}, "width":300, "action":{"type":"minecraft:run_command", "command":"trigger gg.playerSetting set $(trigger)"}}
