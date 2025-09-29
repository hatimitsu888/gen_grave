#> gg:settings/player/ui/graves/detail/
# お墓の情報をダイアログにセットする準備

# プレイヤーの情報を取り出す
function gg:common/player/fetch_data with storage gg_tmp: id

# トリガーをidに変換
scoreboard players operation #tmp.A gg.math = @s gg.playerSetting
scoreboard players remove #tmp.A gg.math 10000

# お墓の情報を取り出す
execute store result storage gg_tmp: id.grave int 1 run scoreboard players get #tmp.A gg.math
function gg:common/grave/fetch_data with storage gg_tmp: id

# リセット
scoreboard players reset #tmp.A gg.math

# 情報を設定
data modify storage gg_common:dialog detail.name set from storage gg_tmp: grave.name
data modify storage gg_common:dialog detail.dimension set from storage gg_tmp: grave.dimension
    # ディメンションを翻訳
    execute if data storage gg_tmp: {grave:{dimension:"minecraft:overworld"}} run data modify storage gg_common:dialog detail.dimension set value "オーバーワールド"
    execute if data storage gg_tmp: {grave:{dimension:"minecraft:the_nether"}} run data modify storage gg_common:dialog detail.dimension set value "ネザー"
    execute if data storage gg_tmp: {grave:{dimension:"minecraft:the_end"}} run data modify storage gg_common:dialog detail.dimension set value "エンド"
execute store result storage gg_common:dialog detail.x int 1 run data get storage gg_tmp: grave.pos[0] 1
execute store result storage gg_common:dialog detail.y int 1 run data get storage gg_tmp: grave.pos[1] 1
execute store result storage gg_common:dialog detail.z int 1 run data get storage gg_tmp: grave.pos[2] 1
data modify storage gg_common:dialog detail.xpL set from storage gg_tmp: grave.xp.levels
data modify storage gg_common:dialog detail.xpP set from storage gg_tmp: grave.xp.points

# idをテキストに
data remove storage gg_tmp: idToText
execute store result storage gg_tmp: idToText.id int 1 run scoreboard players get @s gg.playerSetting
data modify storage gg_common:dialog detail.id set string storage gg_tmp: idToText.id 2

# ダイアログを表示
function gg:settings/player/ui/graves/detail/dialog with storage gg_common:dialog detail
