#> gg:graves/create/get_items/write
# アイテムを文字列に変換

data modify storage gg_tmp: text.B append value {"text": "\n"}

$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(h0)"}
$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(h1)"}
$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(h2)"}
$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(h3)"}
$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(h4)"}
$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(h5)"}
$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(h6)"}
$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(h7)"}
$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(h8)"}

data modify storage gg_tmp: text.B append value {"text": "\n"}

$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(e0)"}
$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(e1)"}
$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(e2)"}
$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(e3)"}

data modify storage gg_tmp: text.B append value {"text": "    "}

$data modify storage gg_tmp: text.B append value {sprite: "minecraft:item/$(e4)"}

# 書き込み
data modify storage gg_tmp: text.A append from storage gg_tmp: text.B
