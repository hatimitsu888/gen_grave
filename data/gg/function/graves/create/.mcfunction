#> gg:graves/create/
# 死亡時の処理

data modify storage gg_common:func_option errorCode set value 0

# リセット
advancement revoke @s only gg:player_death
scoreboard players reset @s gg.playerDeath

# キープインベントリがオンなら無効化
execute if data storage gg_common:world_settings {keepInventory: true} run return 0


# プレイヤーidの取得
execute store result storage gg_tmp: id.player int 1 run scoreboard players get @s gg.id.player

# お墓の最大値(id)を取得
execute store result storage gg_tmp: id.grave int 1 run scoreboard players get @s gg.id.grave


##### データを生成 #####
data remove storage gg_tmp: grave
    # id
    data modify storage gg_tmp: grave.id set from storage gg_tmp: id.grave

    # インベントリ
    data modify storage gg_tmp: grave.inventory set from entity @s Inventory

    # 装備
    data modify storage gg_tmp: grave.equipment set from entity @s equipment

    # 経験値
        # レベル
        execute store result storage gg_tmp: grave.xp.levels int 1 run xp query @s levels

        # ポイント
        execute store result storage gg_tmp: grave.xp.points int 1 run xp query @s points
    
    # ディメンション
    data modify storage gg_tmp: grave.dimension set from entity @s Dimension

    # 位置
    data modify storage gg_tmp: grave.pos set from entity @s Pos
    
# 経験値を計算
execute if data storage gg_common:world_settings {keepExp: false} run function gg:graves/create/math_xp


##### データを挿入 #####
execute store result storage gg_common:func_option errorCode int 1 run function gg:graves/create/insert_data with storage gg_tmp: id

# エラーチェック
execute unless data storage gg_common:func_option {errorCode: 0} run return run function gg:graves/create/error


##### お墓を生成する #####
function gg:graves/create/summon


##### プレイヤーの所持品を消去する #####
clear @s
xp set @s 0 levels
xp set @s 0 points

# お墓のidをくり上げる
scoreboard players add @s gg.id.grave 1
    # 101以上になったらリセット
    execute if score @s gg.id.grave matches 101.. run scoreboard players set @s gg.id.grave 0
