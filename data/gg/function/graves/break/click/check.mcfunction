#> gg:graves/break/click/check
# お墓が壊せるかどうかをチェック

# お墓のidと紐づいたプレイヤーのidを取得
execute store result storage gg_tmp: id.player int 1 run scoreboard players get @s gg.id.player
execute store result storage gg_tmp: id.grave int 1 run scoreboard players get @s gg.id.grave

# プレイヤーのデータを取得
function gg:common/player/fetch_data with storage gg_tmp: id

# 他の人が壊せない設定（自身が持ち主なら無視）
execute if data storage gg_tmp: {player:{settings:{othersBreaking:false}}} unless score @s gg.id.player = @p[tag=gg-this] gg.id.player run return run function gg:graves/break/click/fail

# 効果
execute at @s run particle minecraft:block{block_state:"minecraft:dirt"} ~ ~0.5 ~ 0.2 0.2 0.2 1 10 normal
execute at @s run playsound block.rooted_dirt.break block @a ~ ~ ~ 1 1 0

# ワンクリック
execute if data storage gg_common:world_settings {oneClick:true} run return run function gg:graves/break/

# カウントを減らす
scoreboard players remove @s gg.clickCount 1
function gg:graves/break/click/transformation

# カウントがゼロ
execute if score @s gg.clickCount matches ..0 run function gg:graves/break/
