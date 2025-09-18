#> gg:settings/palyer/inventory/main
# インベントリを見ているときに常時実行

# 操作方法
title @s actionbar [{text:""}, {keybind:"key.inventory", color:green}, {text:"で所持していたアイテムを確認"}, {text:"    "}, {keybind:"key.sneak", color:green}, {text:"で解除"}]

# スニークで解除
execute if predicate gg:sneak run function gg:settings/player/inventory/origin

# リセット
advancement revoke @s only gg:check_inventory
