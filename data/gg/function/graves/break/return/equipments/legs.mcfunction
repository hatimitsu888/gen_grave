#> gg:graves/break/return/equipments/legs
# 腰装備

# アイテムを設定する
execute if items entity @s armor.legs * run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.legs
execute if items entity @s armor.legs * at @s run function gg:graves/break/drop/summon
data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: grave.equipment.legs

# 既にアイテムがなければ装備する
execute unless items entity @s armor.legs * run item replace entity @s armor.legs from entity @n[distance=..1, tag=gg-passItem] armor.head
