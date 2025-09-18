#> gg:settings/palyer/inventory/return/
# インベントリをセットする

# スロットにアイテムがある
$execute unless data storage gg_tmp: dropItems.inventory[{Slot:$(index)b}] run return 0

# アマスタにつける
$data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: dropItems.inventory[{Slot:$(index)b}]

# インベントリに戻す
$item replace entity @s container.$(index) from entity @n[distance=..1, tag=gg-passItem] armor.head
