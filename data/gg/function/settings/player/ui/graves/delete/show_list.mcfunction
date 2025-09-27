#> gg:settings/player/ui/graves/delete/show_list
# お墓のリストを開きなおす

# 削除フラグを消す
data modify storage gg_tmp: player.tmp.deleteNow set value false
function gg:common/player/set_tmp with storage gg_tmp: id

# 一覧に戻る
scoreboard players set @s gg.playerSetting 10
function gg:settings/player/ui/graves/
