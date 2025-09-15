#> gg:graves/break/return/
# アイテムをインベントリに戻す

# 操作用のアマスタを召喚
summon armor_stand ~ ~ ~ {Tags:["gg-passItem"], Invisible:true, Invulnerable:true, NoGravity:true, Small:true}

# 再帰用
scoreboard players set #tmp.A gg.math 0

# インベントリのアイテムを渡す
function gg:graves/break/return/inventory

# リセット
scoreboard players reset #tmp.A gg.math

# 装備
    # ヘルメット
    execute if data storage gg_tmp: grave.equipment.head if items entity @p[tag=gg-this] armor.head * run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.head
    execute if data storage gg_tmp: grave.equipment.head as @p[tag=gg-this] if items entity @s armor.head * at @s run function gg:graves/break/drop/summon
    execute if data storage gg_tmp: grave.equipment.head run data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: grave.equipment.head
    execute if data storage gg_tmp: grave.equipment.head unless items entity @p[tag=gg-this] armor.head * run item replace entity @p[tag=gg-this] armor.head from entity @n[distance=..1, tag=gg-passItem] armor.head

    # チェストプレート
    execute if data storage gg_tmp: grave.equipment.chest if items entity @p[tag=gg-this] armor.chest * run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.chest
    execute if data storage gg_tmp: grave.equipment.chest as @p[tag=gg-this] if items entity @s armor.chest * at @s run function gg:graves/break/drop/summon
    execute if data storage gg_tmp: grave.equipment.chest run data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: grave.equipment.chest
    execute if data storage gg_tmp: grave.equipment.chest unless items entity @p[tag=gg-this] armor.chest * run item replace entity @p[tag=gg-this] armor.chest from entity @n[distance=..1, tag=gg-passItem] armor.head

    # レギンス
    execute if data storage gg_tmp: grave.equipment.legs if items entity @p[tag=gg-this] armor.legs * run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.legs
    execute if data storage gg_tmp: grave.equipment.legs as @p[tag=gg-this] if items entity @s armor.legs * at @s run function gg:graves/break/drop/summon
    execute if data storage gg_tmp: grave.equipment.legs run data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: grave.equipment.legs
    execute if data storage gg_tmp: grave.equipment.legs unless items entity @p[tag=gg-this] armor.legs * run item replace entity @p[tag=gg-this] armor.legs from entity @n[distance=..1, tag=gg-passItem] armor.head

    # ブーツ
    execute if data storage gg_tmp: grave.equipment.feet if items entity @p[tag=gg-this] armor.feet * run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.feet
    execute if data storage gg_tmp: grave.equipment.feet as @p[tag=gg-this] if items entity @s armor.feet * at @s run function gg:graves/break/drop/summon
    execute if data storage gg_tmp: grave.equipment.feet run data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: grave.equipment.feet
    execute if data storage gg_tmp: grave.equipment.feet unless items entity @p[tag=gg-this] armor.feet * run item replace entity @p[tag=gg-this] armor.feet from entity @n[distance=..1, tag=gg-passItem] armor.head

    # オフハンド
    execute if data storage gg_tmp: grave.equipment.offhand if items entity @p[tag=gg-this] weapon.offhand * run data modify storage gg_tmp: dropItems.item set from storage gg_tmp: grave.equipment.offhand
    execute if data storage gg_tmp: grave.equipment.offhand as @p[tag=gg-this] if items entity @s weapon.offhand * at @s run function gg:graves/break/drop/summon
    execute if data storage gg_tmp: grave.equipment.offhand run data modify entity @n[distance=..1, tag=gg-passItem] equipment.head set from storage gg_tmp: grave.equipment.offhand
    execute if data storage gg_tmp: grave.equipment.offhand unless items entity @p[tag=gg-this] weapon.offhand * run item replace entity @p[tag=gg-this] weapon.offhand from entity @n[distance=..1, tag=gg-passItem] armor.head

# アマスタを消す
kill @n[distance=..1, tag=gg-passItem]
