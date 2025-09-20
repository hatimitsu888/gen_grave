#> gg:settings/player/ui/graves/delete/
# 削除するかの確認

# プレイヤーの情報を取り出す
function gg:common/player/fetch_data with storage gg_tmp: id

# トリガーをidに変換
scoreboard players operation #tmp.A gg.math = @s gg.playerSetting
scoreboard players remove #tmp.A gg.math 18000

# お墓の情報を取り出す
execute store result storage gg_tmp: id.grave int 1 run scoreboard players get #tmp.A gg.math
function gg:common/grave/fetch_data with storage gg_tmp: id

# リセット
scoreboard players reset #tmp.A gg.math

# 情報を取り出す
data modify storage gg_common:dialog delete.name set from storage gg_tmp: grave.name
    # id
    execute store result storage gg_tmp: idToText.id int 1 run scoreboard players get @s gg.playerSetting
    data modify storage gg_common:dialog delete.id set string storage gg_tmp: idToText.id 2
    data remove storage gg_tmp: idToText

# ダイアログを生成
function gg:settings/player/ui/graves/delete/dialog with storage gg_common:dialog delete
