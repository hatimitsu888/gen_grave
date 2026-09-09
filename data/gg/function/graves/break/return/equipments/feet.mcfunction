#> gg:graves/break/return/equipments/feet
# 足装備

# アイテムを設定する
execute if items entity @s armor.feet * run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.feet
execute if items entity @s armor.feet * at @s run function gg:graves/break/drop/summon
data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: grave.equipment.feet

# 既にアイテムがなければ装備する
execute unless items entity @s armor.feet * run item replace entity @s armor.feet from entity @n[distance=..1, tag=gg-passItem] armor.head
