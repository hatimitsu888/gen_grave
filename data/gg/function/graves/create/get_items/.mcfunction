#> gg:graves/create/get_items/
# ホットバーと装備のアイテムを取り出す

# リセット
data remove storage gg_tmp: idToText
data modify storage gg_tmp: idToText set value \
{h0:"structure_void", h1:"structure_void", h2:"structure_void", h3:"structure_void", h4:"structure_void", h5:"structure_void", h6:"structure_void", h7:"structure_void", h8:"structure_void", e0:"structure_void", e1:"structure_void", e2:"structure_void", e3:"structure_void", e4:"structure_void"}
## h0～h9・・・ホットバー
## e0～e3・・・装備
## e4・・・オフハンド

# 取り出す
execute if data storage gg_tmp: grave.inventory[{Slot:0b}] run data modify storage gg_tmp: idToText.h0 set string storage gg_tmp: grave.inventory{Slot:0b}.id 10
execute if data storage gg_tmp: grave.inventory[{Slot:1b}] run data modify storage gg_tmp: idToText.h1 set string storage gg_tmp: grave.inventory{Slot:1b}.id 10
execute if data storage gg_tmp: grave.inventory[{Slot:2b}] run data modify storage gg_tmp: idToText.h2 set string storage gg_tmp: grave.inventory{Slot:2b}.id 10
execute if data storage gg_tmp: grave.inventory[{Slot:3b}] run data modify storage gg_tmp: idToText.h3 set string storage gg_tmp: grave.inventory{Slot:3b}.id 10
execute if data storage gg_tmp: grave.inventory[{Slot:4b}] run data modify storage gg_tmp: idToText.h4 set string storage gg_tmp: grave.inventory{Slot:4b}.id 10
execute if data storage gg_tmp: grave.inventory[{Slot:5b}] run data modify storage gg_tmp: idToText.h5 set string storage gg_tmp: grave.inventory{Slot:5b}.id 10
execute if data storage gg_tmp: grave.inventory[{Slot:6b}] run data modify storage gg_tmp: idToText.h6 set string storage gg_tmp: grave.inventory{Slot:6b}.id 10
execute if data storage gg_tmp: grave.inventory[{Slot:7b}] run data modify storage gg_tmp: idToText.h7 set string storage gg_tmp: grave.inventory{Slot:7b}.id 10
execute if data storage gg_tmp: grave.inventory[{Slot:8b}] run data modify storage gg_tmp: idToText.h8 set string storage gg_tmp: grave.inventory{Slot:8b}.id 10

execute if data storage gg_tmp: grave.equipment.head run data modify storage gg_tmp: idToText.e0 set string storage gg_tmp: grave.equipment.head.id 10
execute if data storage gg_tmp: grave.equipment.chest run data modify storage gg_tmp: idToText.e1 set string storage gg_tmp: grave.equipment.chest.id 10
execute if data storage gg_tmp: grave.equipment.legs run data modify storage gg_tmp: idToText.e2 set string storage gg_tmp: grave.equipment.legs.id 10
execute if data storage gg_tmp: grave.equipment.feet run data modify storage gg_tmp: idToText.e3 set string storage gg_tmp: grave.equipment.feet.id 10

execute if data storage gg_tmp: grave.equipment.offhand run data modify storage gg_tmp: idToText.e4 set string storage gg_tmp: grave.equipment.offhand.id 10

# 書き出し
function gg:graves/create/get_items/write with storage gg_tmp: idToText
