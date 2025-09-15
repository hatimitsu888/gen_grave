#> gg:graves/break/click/
# お墓をクリックしたら

# クリックしたプレイヤーにタグをつける
tag @s add gg-this

# クリックされたインタラクションからコアを特定
execute as @e[tag=gg-interaction, predicate=gg:clicked_interaction] on vehicle run function gg:graves/break/click/check

# リセット
tag @s remove gg-this
advancement revoke @s only gg:click_grave
