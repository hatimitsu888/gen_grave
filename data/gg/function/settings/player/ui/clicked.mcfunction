#> gg:settings/player/ui/
# トリガーが増えたら

##### 開く #####
# ホーム
execute if score @s gg.playerSetting matches 1 run dialog show @s gg:player_setting

# 設定
execute if score @s gg.playerSetting matches 3 run function gg:settings/player/ui/setting/

# お墓
execute if score @s gg.playerSetting matches 10..12 run function gg:settings/player/ui/graves/

##### 処理 #####
# 閉じる
execute if score @s gg.playerSetting matches 0 run dialog clear @s

# 設定を反映 initial=1
execute if score @s gg.playerSetting matches 1000..9999 run function gg:settings/player/ui/setting/apply

# お墓を開く initial=10
execute if score @s gg.playerSetting matches 10000..19999 run function gg:settings/player/ui/graves/grave/clicked

# リセット
advancement revoke @s only gg:settings/player
scoreboard players set @s gg.playerSetting -1
scoreboard players enable @s gg.playerSetting
