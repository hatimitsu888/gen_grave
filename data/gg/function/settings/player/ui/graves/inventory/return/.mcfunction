#> gg:settings/player/ui/graves/inventory/return/
# アイテムをインベントリに戻す

# 操作用のアマスタを召喚
summon armor_stand ~ ~ ~ {Tags:["gg-passItem"], Invisible:true, Invulnerable:true, NoGravity:true, Small:true}

# 再帰用
scoreboard players set #tmp.A gg.math 0

# インベントリにセット
function gg:settings/player/ui/graves/inventory/return/inventory

# リセット
scoreboard players reset #tmp.A gg.math

# 装備
    # ヘルメット
    execute if data storage gg_tmp: dropItems.equipment.head run data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: dropItems.equipment.head
    execute if data storage gg_tmp: dropItems.equipment.head run item replace entity @s armor.head from entity @n[distance=..1, tag=gg-passItem] armor.head

    # チェストプレート
    execute if data storage gg_tmp: dropItems.equipment.chest run data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: dropItems.equipment.chest
    execute if data storage gg_tmp: dropItems.equipment.chest run item replace entity @s armor.chest from entity @n[distance=..1, tag=gg-passItem] armor.head

    # レギンス
    execute if data storage gg_tmp: dropItems.equipment.legs run data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: dropItems.equipment.legs
    execute if data storage gg_tmp: dropItems.equipment.legs run item replace entity @s armor.legs from entity @n[distance=..1, tag=gg-passItem] armor.head

    # ブーツ
    execute if data storage gg_tmp: dropItems.equipment.feet run data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: dropItems.equipment.feet
    execute if data storage gg_tmp: dropItems.equipment.feet run item replace entity @s armor.feet from entity @n[distance=..1, tag=gg-passItem] armor.head

    # オフハンド
    execute if data storage gg_tmp: dropItems.equipment.offhand run data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: dropItems.equipment.offhand
    execute if data storage gg_tmp: dropItems.equipment.offhand run item replace entity @s weapon.offhand from entity @n[distance=..1, tag=gg-passItem] armor.head

# アマスタを消す
kill @n[distance=..1, tag=gg-passItem]
