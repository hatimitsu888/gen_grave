#> gg:graves/break/return/equipments/chest
# 体装備

# アイテムを設定する
execute if items entity @s armor.chest * run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.chest
execute if items entity @s armor.chest * at @s run function gg:graves/break/drop/summon
data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: grave.equipment.chest

# 既にアイテムがなければ装備する
execute unless items entity @s armor.chest * run item replace entity @s armor.chest from entity @n[distance=..1, tag=gg-passItem] armor.head
