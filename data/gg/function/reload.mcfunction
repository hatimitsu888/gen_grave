#> gg:reload
# リロード時の処理

# バージョン
data modify storage gg_common:dialog version set value "v1.2"

# ワールド設定を初期化（初インストール時のみ）
execute unless data storage gg_common:world_settings newInstall run function gg:settings/world/default

# キープインベントリをオンにする
gamerule keep_inventory true

##### スコア #####
# プレイヤーid
scoreboard objectives add gg.id.player dummy
    # ダミースコアに加算
    scoreboard players add #maxPlayerId gg.id.player 0

# お墓のid
scoreboard objectives add gg.id.grave dummy

# 死亡時に加算するスコア
scoreboard objectives add gg.playerDeath deathCount

# 計算用のスコア
scoreboard objectives add gg.math dummy

# お墓の状態
scoreboard objectives add gg.clickCount dummy

# ワールド設定用のトリガー
scoreboard objectives add gg.worldSetting trigger

# プレイヤー設定用のトリガー
scoreboard objectives add gg.playerSetting trigger


# 当たり判定のないチーム
team add gg.noCollision
team modify gg.noCollision collisionRule never
