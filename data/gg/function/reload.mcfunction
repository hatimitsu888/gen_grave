#> gg:reload
# リロード時の処理

# ワールド設定を初期化（初インストール時のみ）
execute unless data storage gg_common:world_settings newInstall run function gg:settings/world/default

##### スコア #####
# プレイヤーid
scoreboard objectives add gg.id.player dummy
    # ダミースコアに加算
    scoreboard players add #maxPlayerId gg.id.player 0

# お墓のid
scoreboard objectives add gg.id.player dummy
