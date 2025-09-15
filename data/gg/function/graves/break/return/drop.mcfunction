#> gg:graves/break/return/drop
# アイテムを落とす

# アイテムをドロップ用のストレージに
$data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.inventory[{Slot:$(index)b}]

# ドロップ
function gg:graves/break/drop/summon
