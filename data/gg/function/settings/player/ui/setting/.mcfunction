#> gg:settings/player/ui/setting/
# プレイヤー設定を開く準備

# リセット
data modify storage gg_common:dialog playerSettings set value {text:"", othersBreakingF:"false", othersBreakingT:"false", exp:"false", items:"false"}

# マクロを設定
data modify storage gg_common:dialog playerSettings.text set value "$(othersBreaking)$(exp)"

# プレイヤー情報を取得
execute store result storage gg_tmp: id.player int 1 run scoreboard players get @s gg.id.player
function gg:common/player/fetch_data with storage gg_tmp: id

# プレイヤー設定を翻訳
execute if data storage gg_tmp: {player:{settings:{othersBreaking: true}}} run data modify storage gg_common:dialog playerSettings.othersBreakingT set value "true"
execute if data storage gg_tmp: {player:{settings:{othersBreaking: false}}} run data modify storage gg_common:dialog playerSettings.othersBreakingF set value "true"

execute if data storage gg_tmp: {player:{settings:{visibles:{exp: true}}}} run data modify storage gg_common:dialog playerSettings.exp set value "true"

execute if data storage gg_tmp: {player:{settings:{visibles:{items: true}}}} run data modify storage gg_common:dialog playerSettings.items set value "true"

# ダイアログを開く
function gg:settings/player/ui/setting/dialog with storage gg_common:dialog playerSettings
