#> gg:settings/player/ui/graves/grave/clicked
# お墓関連の操作を確認

# プレイヤーのidを取得
execute store result storage gg_tmp: id.player int 1 run scoreboard players get @s gg.id.player

# お墓を開く
execute if score @s gg.playerSetting matches 10000..10999 run function gg:settings/player/ui/graves/detail/

# インベントリを確認
execute if score @s gg.playerSetting matches 11000..12999 run function gg:settings/player/ui/graves/inventory/grave

# 憑依
execute if score @s gg.playerSetting matches 13000..13999

# テレポート
execute if score @s gg.playerSetting matches 14000..14999

# 発光
execute if score @s gg.playerSetting matches 15000..15999



# 名前を変更
# execute if score @s gg.playerSetting matches 17000..17999

# 名前を適用
# execute if score @s gg.playerSetting matches 18000..18999

# 削除
execute if score @s gg.playerSetting matches 19000..19999
