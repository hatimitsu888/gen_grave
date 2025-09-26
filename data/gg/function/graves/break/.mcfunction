#> gg:graves/break/
# お墓が壊れる

# お墓の情報を取得
function gg:common/grave/fetch_data with storage gg_tmp: id

# インベントリの中身を一時保存
data modify storage gg_tmp: dropItems.inventory set from storage gg_tmp: grave.inventory


# アイテムをドロップ
execute if data storage gg_common:world_settings {quickGet:false} at @s run function gg:graves/break/drop/

# インベントリの元の位置に戻す
execute if data storage gg_common:world_settings {quickGet:true} at @s run function gg:graves/break/return/


# 経験値
execute as @p[tag=gg-this] run function gg:graves/break/xp with storage gg_tmp: grave.xp


# お墓を削除
function gg:common/grave/delete/
