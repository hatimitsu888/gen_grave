#> gg:player_init
# プレイヤーが新しく入ったときの初期設定

# トリガーを設定
scoreboard players set @s gg.playerSetting -1
scoreboard players enable @s gg.playerSetting

# ダミースコアが設定されていなかったら初期設定
execute unless score #maxPlayerId gg.id.player matches -2147483648..2147483647 run scoreboard players set #maxPlayerId gg.id.player 0

# お墓の最大値が設定されていなかったら初期設定
execute unless score @s gg.id.grave matches -2147483648..2147483647 run scoreboard players set @s gg.id.grave 0

# ストレージを作成
data modify storage gg_common:func_option playerSettings.resetId set value true
data modify storage gg_common:func_option playerSettings.resetGraves set value true
function gg:settings/player/default/
