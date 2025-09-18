#> gg:graves/create/summon
# お墓を召喚

# 召喚
summon text_display ~ ~ ~ {Tags:["gg-init", "gg-grave", "gg-core"], text:"", shadow:0b, billboard:"vertical", transformation:{left_rotation:[0.0f, 0.0f, 0.0f, 1.0f], translation:[0.0f, 1.0f, 0.0f], scale:[0.8f, 0.8f, 0.8f], right_rotation:[0.0f, 0.0f, 0.0f, 1.0f]}}
summon interaction ~ ~ ~ {Tags:["gg-init", "gg-grave", "gg-interaction"], width:0.8f, height:0.5f}
summon item_display ~ ~ ~ {Tags:["gg-init", "gg-grave", "gg-base"], item:{id:"minecraft:player_head", count:1b, components:{"minecraft:profile":{name:"hatimitsu83", id:[I; -1943600178, 1319259255, -1486395443, 341296842], properties:[{name:"textures", signature:"VkqOtsFkaBZX214z9DMdKp53bO9WZp1rQjfPUKEZRobblsJtC9x7FwFLS7yajujnblsCw++SqcsijKx5PRdQXr9cM1dJ6VJxFFaeLAXCFbF1PJJdol/JU58BD7SxO6ehCXyeH9HyQy7U2O35KH3cBSjsyxrX1ln2a+szuNXIcsD5MdlexPL6l5KLtAtgwfpNwf00ybZMFHLySLWcaja9Owlu6q+WxNKErDTY+kT3Kdv4MwT6tXnXhx8nXhUFKTeMfbRLGiwrMK6qgClKMtlAyPFkblYxcV1O97EoqixOzoOXnqVQZrROvu1U6y2Dv4/5yboLbrkWP2klSAa1FcP75Oolv+8qlYjhc07wvL0zGqPWYHp1EwspH5SmdrT32mVoSpYcmBky6css5qOwCl2/flB8dDd15Ym7Pt3ofPErvZuCk1UHmrEzm3UfiSlk46Xn6iiNCXoSxRwMySYqnXs+7omgyq91BQPGA8zW17TWZa/US6CSs4HsKkjKxuKESMasqypvT5FuN3PxWe7g5D2UYEnk8kyTwKdpw4eBrb5FW48EreZxN39lGwOXDhyKaMuuxoBvukKfmjnWD68wQlPkdl3d4ZGmz1cJOIZL5nMPlzdDy2UFhqmy6196omo482OzphU9wyoC72bf4TEYUULlnaj5/xK2n8JdMTSUe+y1TKc=", value:"ewogICJ0aW1lc3RhbXAiIDogMTc1NzkyMDI2NDU1OSwKICAicHJvZmlsZUlkIiA6ICI4YzI3MDNjZTRlYTI0Yzc3YTc2NzY3Y2QxNDU3YzZjYSIsCiAgInByb2ZpbGVOYW1lIiA6ICJoYXRpbWl0c3U4MyIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9iYjA3MmJmNzZhMzY5OTNkNGFiNjA1MzQ1ZmYzMzUyZmZkNjBlNThkMjUzY2FhODkyYzM3ZDQ2OTJiZGJmZTZiIgogICAgfQogIH0KfQ=="}]}}},transformation:{left_rotation:[0f, 0f, 0f, 1f],right_rotation:[0f, 0f, 0f, 1f], translation:[0.0f, 0.2f, 0.0f],scale:[1.6f, 0.8f, 1.6f]}}
summon item_display ~ ~ ~ {Tags:["gg-init", "gg-grave", "gg-head"], item:{id:"minecraft:player_head", count:1b}, transformation:{left_rotation:{axis:[1.0f, 0.0f, 0.0f], angle:0.5236f}, translation:[0.0f, 0.5f, 0.2f], scale:[1.0f, 1.0f, 1.0f], right_rotation:[0.0f, 0.0f, 0.0f, 1.0f]}}

# プレイヤーの頭に変更
data modify entity @n[distance=..1, tag=gg-head, tag=gg-init] item.components."minecraft:profile".id set from entity @s UUID

# テキストを変更
data remove storage gg_tmp: text
    # 名前
    data modify storage gg_tmp: text.A append value [{selector:"@p[tag=gg-this]"}, {text:"のお墓"}]
    
    # プレイヤーの設定を取り出す
    function gg:common/player/fetch_data with storage gg_tmp: id

    # アイテムの表示
    execute if data storage gg_tmp: {player:{settings:{visibles:{items:true}}}} run function gg:graves/create/get_items/
    
    # 経験値の表示
    execute if data storage gg_tmp: {player:{settings:{visibles:{exp:true}}}} run data modify storage gg_tmp: text.A append value [{text:"\n"}, {text:"レベル："}, {nbt:"grave.xp.levels", storage:"gg_tmp:", color:green}]

# 適用
tag @s add gg-this
data modify entity @n[distance=..1, tag=gg-core, tag=gg-init] text set from storage gg_tmp: text.A
tag @s remove gg-this

# コアにすべて乗せる
ride @n[distance=..1, tag=gg-init, tag=gg-interaction] mount @n[distance=..1, tag=gg-init, tag=gg-core]
ride @n[distance=..1, tag=gg-init, tag=gg-base] mount @n[distance=..1, tag=gg-init, tag=gg-core]
ride @n[distance=..1, tag=gg-init, tag=gg-head] mount @n[distance=..1, tag=gg-init, tag=gg-core]

# idを設定
execute store result score @n[distance=..1, tag=gg-init, tag=gg-core] gg.id.player run data get storage gg_tmp: id.player
execute store result score @n[distance=..1, tag=gg-init, tag=gg-core] gg.id.grave run data get storage gg_tmp: id.grave

# カウントを追加
scoreboard players set @n[distance=..1, tag=gg-init, tag=gg-core] gg.clickCount 5

# タグを消去
tag @e[tag=gg-init] remove gg-init
