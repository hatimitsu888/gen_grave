#> gg:common:grave/delete/async
# 非同期で実行

# idを保存
data modify storage gg_tmp: id.player set from storage gg_async: tmp.pass.pId
data modify storage gg_tmp: id.grave set from storage gg_async: tmp.pass.gId

# プレイヤーの情報を取得する
function gg:common/player/fetch_data with storage gg_tmp: id

# お墓の情報を取得する
function gg:common/grave/fetch_data with storage gg_tmp: id

# チャンクロード情報を取得
data modify storage gg_tmp: chunkLoad set from storage gg_async: tmp.pass.chunkLoad

# 削除
function gg:common/grave/delete/delete
