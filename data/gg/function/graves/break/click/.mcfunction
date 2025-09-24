#> gg:graves/break/click/
# お墓をクリックしたら

# クリックしたプレイヤーにタグをつける
tag @s add gg-this

# クリックされたインタラクションからコアを特定
execute as @n[tag=gg-interaction, predicate=gg:clicked_interaction] on vehicle run function gg:graves/break/click/check

# インタラクションの情報を消去
execute as @n[tag=gg-interaction, predicate=gg:clicked_interaction] run data remove entity @s attack
execute as @n[tag=gg-interaction, predicate=gg:clicked_interaction] run data remove entity @s interaction

# リセット
tag @s remove gg-this
advancement revoke @s only gg:click_grave
