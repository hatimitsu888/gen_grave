#> gg:settings/world/ui/main/apply
# トリガーの内容から設定項目を読み取る

# リセット
data remove storage gg_common:dialog scoreToString

# スコアを持ってくる
execute store result storage gg_common:dialog scoreToString.score int 1 run scoreboard players get @s gg.worldSetting

# 経験値
data modify storage gg_common:dialog scoreToString.result set string storage gg_common:dialog scoreToString.score 1 2
execute if data storage gg_common:dialog {scoreToString:{result:"0"}} run data modify storage gg_common:world_settings keepExp set value false
execute if data storage gg_common:dialog {scoreToString:{result:"1"}} run data modify storage gg_common:world_settings keepExp set value true

# クイック取得
data modify storage gg_common:dialog scoreToString.result set string storage gg_common:dialog scoreToString.score 2 3
execute if data storage gg_common:dialog {scoreToString:{result:"0"}} run data modify storage gg_common:world_settings quickGet set value false
execute if data storage gg_common:dialog {scoreToString:{result:"1"}} run data modify storage gg_common:world_settings quickGet set value true

# ワンクリック
data modify storage gg_common:dialog scoreToString.result set string storage gg_common:dialog scoreToString.score 3 4
execute if data storage gg_common:dialog {scoreToString:{result:"0"}} run data modify storage gg_common:world_settings oneClick set value false
execute if data storage gg_common:dialog {scoreToString:{result:"1"}} run data modify storage gg_common:world_settings oneClick set value true

# テレポート
data modify storage gg_common:dialog scoreToString.result set string storage gg_common:dialog scoreToString.score 5 6
execute if data storage gg_common:dialog {scoreToString:{result:"0"}} run data modify storage gg_common:world_settings tpGrave set value false
execute if data storage gg_common:dialog {scoreToString:{result:"1"}} run data modify storage gg_common:world_settings tpGrave set value true

# キープインベントリ
data modify storage gg_common:dialog scoreToString.result set string storage gg_common:dialog scoreToString.score 6 7
execute if data storage gg_common:dialog {scoreToString:{result:"0"}} run data modify storage gg_common:world_settings keepInventory set value false
execute if data storage gg_common:dialog {scoreToString:{result:"1"}} run data modify storage gg_common:world_settings keepInventory set value true

# 保存数
data modify storage gg_common:dialog scoreToString.result set string storage gg_common:dialog scoreToString.score 7
function gg:settings/world/ui/main/change_int with storage gg_common:dialog scoreToString
