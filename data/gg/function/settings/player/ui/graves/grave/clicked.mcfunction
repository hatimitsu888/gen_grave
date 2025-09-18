#> gg:settings/player/ui/graves/grave/clicked
# お墓関連の操作を確認

# プレイヤーのidを取得
execute store result storage gg_tmp: id.player int 1 run scoreboard players get @s gg.id.player

# お墓を開く
execute if score @s gg.playerSetting matches 10000..10999

# インベントリを確認
execute if score @s gg.playerSetting matches 11000..11999 run function gg:settings/player/inventory/grave
