#> gg:settings/player/ui/graves/write/old
# 古い順で取り出す

# 取り出す
data modify storage gg_tmp: grave set from storage gg_tmp: graves[0]

# 情報をまとめる
function gg:settings/player/ui/graves/write/

# 削除
data remove storage gg_tmp: graves[0]

# 再帰
execute if data storage gg_tmp: graves[0] run function gg:settings/player/ui/graves/write/old
