#> gg:settings/player/ui/graves/write/new
# 新しい順で取り出す

# 取り出す
data modify storage gg_tmp: grave set from storage gg_tmp: graves[-1]

# 情報をまとめる
function gg:settings/player/ui/graves/write/

# 削除
data remove storage gg_tmp: graves[-1]

# 再帰
execute if data storage gg_tmp: graves[-1] run function gg:settings/player/ui/graves/write/new
