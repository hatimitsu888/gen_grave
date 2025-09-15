#> gg:graves/create/error
# エラーが起きたら通知する

# プレイヤーidの不一致
execute if data storage gg_common:func_option {errorCode: 100} run tellraw @s \
    [{text:"[GG-ERROR: 100] ",color:gray},{text:"ストレージ内にプレイヤーのデータが存在していません。",color:white}]
