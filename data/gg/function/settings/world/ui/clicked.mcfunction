#> gg:settings/world/ui/
# トリガーが増えたら

# 設定を適用
execute if score @s gg.worldSetting matches 10000000.. run function gg:settings/world/ui/main/apply

# トリガーをリセット
scoreboard players set @s gg.worldSetting -1

# 進捗をリセット
advancement revoke @s only gg:settings/world
