#> gg:settings/player/ui/dialog
# ダイアログを表示

$dialog show @s {\
    "type": "minecraft:multi_action",\
    "title": {\
        "text": "Gen Grave (プレイヤー設定)"\
    },\
    "body": [\
        {\
            "type": "minecraft:plain_message",\
            "contents": [\
                {\
                    "text": "並べ替え："\
                },\
                $(new),\
                "  ",\
                $(old) \
            ]\
        }\
    ],\
    "can_close_with_escape": true,\
    "pause": false,\
    "after_action": "none",\
    "exit_action": {\
        "label": "戻る",\
        "action": {\
            "type": "minecraft:run_command",\
            "command": "trigger gg.playerSetting set 1"\
        }\
    },\
    "columns": 1,\
    "actions": $(actions) \
}