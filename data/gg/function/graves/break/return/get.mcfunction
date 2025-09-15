#> gg:graves/break/return/get
# インベントリから取り出す

# スロットにアイテムがある
$execute unless data storage gg_tmp: grave.inventory[{Slot:$(index)b}] run return 0

# アーマースタンドにつける
$data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: grave.inventory[{Slot:$(index)b}]

# インベントリのスロットにすでにアイテムがあったら落とす
$execute as @p[tag=gg-this] if data entity @s Inventory[{Slot:$(index)b}] at @s run return run function gg:graves/break/return/drop with storage gg_tmp: dropItems

# インベントリに戻す
$item replace entity @p[tag=gg-this] container.$(index) from entity @n[distance=..1, tag=gg-passItem] armor.head
