#> gg:graves/break/drop/inventory
# インベントリの中身をすべて出す

# インベントリの中身を出す
data modify storage gg_tmp: dropItems.item set from storage gg_tmp: dropItems.inventory[0]

# 落とす
function gg:graves/break/drop/summon

# インベントリの中身を消去
data remove storage gg_tmp: dropItems.inventory[0]

# 再帰
execute if data storage gg_tmp: dropItems.inventory[0] run function gg:graves/break/drop/inventory
