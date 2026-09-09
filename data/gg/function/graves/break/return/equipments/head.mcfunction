#> gg:graves/break/return/equipments/head
# 頭装備

# アイテムを設定する
execute if items entity @s armor.head * run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.head
execute if items entity @s armor.head * at @s run function gg:graves/break/drop/summon
data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: grave.equipment.head

# 既にアイテムがなければ装備する
execute unless items entity @s armor.head * run item replace entity @s armor.head from entity @n[distance=..1, tag=gg-passItem] armor.head
