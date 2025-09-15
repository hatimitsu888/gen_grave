#> gg:graves/break/drop/summon
# アイテムをドロップする

# 空のアイテム
loot spawn ~ ~ ~ loot gg:dropped_item

# アイテムをすり替える
data modify entity @n[distance=..1, predicate=gg:dropped_item] Item set from storage gg_tmp: dropItems.item
