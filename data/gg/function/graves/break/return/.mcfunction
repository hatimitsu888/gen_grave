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
    execute if data storage gg_tmp: grave.equipment.head as @p[tag=gg-this] run function gg:graves/break/return/equipments/head

    # チェストプレート
    execute if data storage gg_tmp: grave.equipment.chest as @p[tag=gg-this] run function gg:graves/break/return/equipments/chest

    # レギンス
    execute if data storage gg_tmp: grave.equipment.legs as @p[tag=gg-this] run function gg:graves/break/return/equipments/legs

    # ブーツ
    execute if data storage gg_tmp: grave.equipment.feet as @p[tag=gg-this] run function gg:graves/break/return/equipments/feet

    # オフハンド
    execute if data storage gg_tmp: grave.equipment.offhand as @p[tag=gg-this] run function gg:graves/break/return/equipments/offhand

# アマスタを消す
kill @n[distance=..1, tag=gg-passItem]
