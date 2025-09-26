#> gg:common:grave/delete/glowing
# 発光中だったら

# チャンクのロード情報を取得
data modify storage gg_tmp: chunkLoad set from storage gg_tmp: player.tmp.chunkLoads.glowing

# データを削除
data remove storage gg_tmp: player.tmp.chunkLoads.glowing

# 情報を保存
function gg:common/player/set_tmp with storage gg_tmp: id
