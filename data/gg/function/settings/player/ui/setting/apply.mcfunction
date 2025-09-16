#> gg:settings/player/ui/setting/apply
# 設定を反映

# リセット
data remove storage gg_common:dialog scoreToString

# スコアを持ってくる
execute store result storage gg_common:dialog scoreToString.score int 1 run scoreboard players get @s gg.playerSetting

# 破壊
data modify storage gg_common:dialog scoreToString.result set string storage gg_common:dialog scoreToString.score 1 2
execute if data storage gg_common:dialog {scoreToString:{result:"0"}} run data modify storage gg_tmp: player.settings.othersBreaking set value false
execute if data storage gg_common:dialog {scoreToString:{result:"1"}} run data modify storage gg_tmp: player.settings.othersBreaking set value true

# 経験値
data modify storage gg_common:dialog scoreToString.result set string storage gg_common:dialog scoreToString.score 2 3
execute if data storage gg_common:dialog {scoreToString:{result:"0"}} run data modify storage gg_tmp: player.settings.visibles.exp set value false
execute if data storage gg_common:dialog {scoreToString:{result:"1"}} run data modify storage gg_tmp: player.settings.visibles.exp set value true

# アイテム
data modify storage gg_common:dialog scoreToString.result set string storage gg_common:dialog scoreToString.score 3 4
execute if data storage gg_common:dialog {scoreToString:{result:"0"}} run data modify storage gg_tmp: player.settings.visibles.items set value false
execute if data storage gg_common:dialog {scoreToString:{result:"1"}} run data modify storage gg_tmp: player.settings.visibles.items set value true

# プレイヤーidを取得
execute store result storage gg_tmp: id.player int 1 run scoreboard players get @s gg.id.player

# 設定を反映
function gg:common/player/write_setting with storage gg_tmp: id

# 戻る
dialog show @s gg:player_setting
