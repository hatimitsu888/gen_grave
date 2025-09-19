#> gg:settings/player/ui/graves/inventory/main
# インベントリを見ているときに常時実行

# 操作方法
title @s actionbar [{text:""}, {keybind:"key.inventory", color:green}, {text:"で所持していたアイテムを確認"}, {text:"    "}, {keybind:"key.sneak", color:green}, {text:"で解除"}]

# ゲームモードが変更されたら
execute unless entity @s[gamemode=spectator] run function gg:settings/player/ui/graves/inventory/origin

# 移動したら解除
execute unless entity @n[dx=0, dy=0, dz=0, tag=gg-inv] run function gg:settings/player/ui/graves/inventory/origin

# スニークで解除
execute if predicate gg:sneak run function gg:settings/player/ui/graves/inventory/origin

# リセット
advancement revoke @s only gg:check_inventory
