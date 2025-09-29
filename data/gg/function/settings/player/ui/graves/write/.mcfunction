#> gg:settings/player/ui/graves/write/
# 整理

# お墓のidを取得
execute store result score #tmp.A gg.math run data get storage gg_tmp: grave.id 1

# idをトリガーに変換
scoreboard players add #tmp.A gg.math 10000
execute store result storage gg_common:dialog label.triggerA int 1 run scoreboard players get #tmp.A gg.math
scoreboard players add #tmp.A gg.math 1000
execute store result storage gg_common:dialog label.triggerB int 1 run scoreboard players get #tmp.A gg.math

# リセット
scoreboard players reset #tmp.A gg.math

# 名前を設定
data modify storage gg_common:dialog label.name set from storage gg_tmp: grave.name

# ディメンションを取り出す
data modify storage gg_common:dialog label.dimension set from storage gg_tmp: grave.dimension
    # ディメンションを翻訳
    execute if data storage gg_tmp: {grave:{dimension:"minecraft:overworld"}} run data modify storage gg_common:dialog label.dimension set value "オーバーワールド"
    execute if data storage gg_tmp: {grave:{dimension:"minecraft:the_nether"}} run data modify storage gg_common:dialog label.dimension set value "ネザー"
    execute if data storage gg_tmp: {grave:{dimension:"minecraft:the_end"}} run data modify storage gg_common:dialog label.dimension set value "エンド"

# 書き出し
function gg:settings/player/ui/graves/write/write with storage gg_common:dialog label
