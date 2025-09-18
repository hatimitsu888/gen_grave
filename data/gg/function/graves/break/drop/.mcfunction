#> gg:graves/break/drop/
# アイテムをドロップする準備

# インベントリ
execute if data storage gg_tmp: dropItems.inventory[0] run function gg:graves/break/drop/inventory

# 装備
    # ヘルメット
    execute if data storage gg_tmp: grave.equipment.head run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.head
    execute if data storage gg_tmp: grave.equipment.head run function gg:graves/break/drop/summon

    # チェストプレート
    execute if data storage gg_tmp: grave.equipment.chest run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.chest
    execute if data storage gg_tmp: grave.equipment.chest run function gg:graves/break/drop/summon

    # レギンス
    execute if data storage gg_tmp: grave.equipment.legs run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.legs
    execute if data storage gg_tmp: grave.equipment.legs run function gg:graves/break/drop/summon

    # ブーツ
    execute if data storage gg_tmp: grave.equipment.feet run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.feet
    execute if data storage gg_tmp: grave.equipment.feet run function gg:graves/break/drop/summon

    # オフハンド
    execute if data storage gg_tmp: grave.equipment.offhand run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.offhand
    execute if data storage gg_tmp: grave.equipment.offhand run function gg:graves/break/drop/summon
