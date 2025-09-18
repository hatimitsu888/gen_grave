#> gg:settings/palyer/inventory/grave
# お墓のインベントリの中を確認する

# ダイアログを消す
dialog clear @s

# プレイヤーの情報を取得
function gg:common/player/fetch_data with storage gg_tmp: id

# お墓のidを取得
scoreboard players operation #tmp.A gg.math = @s gg.playerSetting
scoreboard players remove #tmp.A gg.math 11000

# お墓の情報を取得
execute store result storage gg_tmp: id.grave int 1 run scoreboard players get #tmp.A gg.math
function gg:common/grave/fetch_data with storage gg_tmp: id

# リセット
scoreboard players reset #tmp.A gg.math

# プレイヤーの現在のインベントリと装備を保存
data modify storage gg_tmp: player.tmp.origin set value {inventory:[], equipment:{}}
data modify storage gg_tmp: player.tmp.origin.inventory set from entity @s Inventory
data modify storage gg_tmp: player.tmp.origin.equipment set from entity @s equipment

# ゲームモードを保存
execute if entity @s[gamemode=survival] run data modify storage gg_tmp: player.tmp.gamemode set value 0
execute if entity @s[gamemode=creative] run data modify storage gg_tmp: player.tmp.gamemode set value 1
execute if entity @s[gamemode=adventure] run data modify storage gg_tmp: player.tmp.gamemode set value 2

# 保存
function gg:settings/player/inventory/set_tmp with storage gg_tmp: id

# リセット
data remove storage gg_tmp: player.tmp

# タグを付与
tag @s add gg-checkInv

# アイテムを全消去
clear @s

# マネキンを召喚
summon mannequin ~ ~ ~ {Tags:["gg-init","gg-inv"], description:{text:"(確認中)"}, immovable:true, Invulnerable:true}
    # スキンを適用
    data modify entity @n[distance=..1,tag=gg-init,tag=gg-inv] profile.id set from entity @s UUID
    
    # 当たり判定を消す
    team join gg.noCollision @n[distance=..1,tag=gg-init,tag=gg-inv]

    # idを一致させる
    scoreboard players operation @n[distance=..1,tag=gg-init,tag=gg-inv] gg.id.player = @s gg.id.player

    # 目線と位置を合わせる
    data modify entity @n[distance=..1,tag=gg-init,tag=gg-inv] Pos set from entity @s Pos
    data modify entity @n[distance=..1,tag=gg-init,tag=gg-inv] Rotation set from entity @s Rotation

# スペクテイターモード
gamemode spectator @s

# 目線をマネキンに合わせる
spectate @n[distance=..1,tag=gg-init,tag=gg-inv] @s

# タグ削除
tag @n[distance=..1, tag=gg-init] remove gg-init

# お墓のアイテムを操作用のストレージに入れる
data modify storage gg_tmp: dropItems.inventory set from storage gg_tmp: grave.inventory
data modify storage gg_tmp: dropItems.equipment set from storage gg_tmp: grave.equipment

# インベントリに戻す
function gg:settings/player/inventory/return/
