#> gg:settings/world/ui/main/
# ワールド設定のメインページを開く

# トリガーを有効化
scoreboard players enable @s gg.worldSetting

# すべて初期化
data modify storage gg_common:dialog worldSettings set value {version:"0.0", keepExpT:"false", keepExpF:"false", quickGetT:"false", quickGetF:"false", oneClickT:"false", oneClickF:"false", tpGraveT:"false", tpGraveF:"false", graveMax:-1, keepInventoryT:"false", keepInventoryF:"false", text:""}

# バージョンを設定
data modify storage gg_common:dialog worldSettings.version set from storage gg_common:dialog version

# マクロを設定
data modify storage gg_common:dialog worldSettings.text set value "$(keepExp)$(quickGet)$(oneClick)0$(tpGrave)$(keepInventory)$(graveMax)"

# お墓の上限を取得
data modify storage gg_common:dialog worldSettings.graveMax set from storage gg_common:world_settings graveMax

# ワールド設定をboolean型に翻訳
execute if data storage gg_common:world_settings {keepExp: true} run data modify storage gg_common:dialog worldSettings.keepExpT set value "true"
execute if data storage gg_common:world_settings {keepExp: false} run data modify storage gg_common:dialog worldSettings.keepExpF set value "true"

execute if data storage gg_common:world_settings {quickGet: true} run data modify storage gg_common:dialog worldSettings.quickGetT set value "true"
execute if data storage gg_common:world_settings {quickGet: false} run data modify storage gg_common:dialog worldSettings.quickGetF set value "true"

execute if data storage gg_common:world_settings {oneClick: true} run data modify storage gg_common:dialog worldSettings.oneClickT set value "true"
execute if data storage gg_common:world_settings {oneClick: false} run data modify storage gg_common:dialog worldSettings.oneClickF set value "true"

execute if data storage gg_common:world_settings {tpGrave: true} run data modify storage gg_common:dialog worldSettings.tpGraveT set value "true"
execute if data storage gg_common:world_settings {tpGrave: false} run data modify storage gg_common:dialog worldSettings.tpGraveF set value "true"

execute if data storage gg_common:world_settings {keepInventory: true} run data modify storage gg_common:dialog worldSettings.keepInventoryT set value "true"
execute if data storage gg_common:world_settings {keepInventory: false} run data modify storage gg_common:dialog worldSettings.keepInventoryF set value "true"

# ダイアログを開く
function gg:settings/world/ui/main/dialog with storage gg_common:dialog worldSettings
