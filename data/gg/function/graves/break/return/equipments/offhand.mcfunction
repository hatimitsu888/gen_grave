#> gg:graves/break/return/equipments/chest
# 体装備

# アイテムを設定する
execute if items entity @s weapon.offhand * run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.offhand
execute if items entity @s weapon.offhand * at @s run function gg:graves/break/drop/summon
data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: grave.equipment.offhand

# 既にアイテムがなければ装備する
execute unless items entity @s weapon.offhand * run item replace entity @s weapon.offhand from entity @n[distance=..1, tag=gg-passItem] armor.head
