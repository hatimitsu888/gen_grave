#> gg:settings/player/ui/dialog
# ダイアログを表示

$dialog show @s {\
    "type": "minecraft:multi_action",\
    "title": {\
        "text": "Gen Grave (個人設定)"\
    },\
    "body": [\
        {\
            "type": "minecraft:plain_message",\
            "contents": [\
                {\
                    "text": "お墓の数："\
                },\
                {\
                    "text": "$(count)    ",\
                    "color": "aqua"\
                },\
                [\
                    {\
                        "text": "最大：",\
                        "hover_event": {\
                            "action": "show_text",\
                            "value": "この最大値を超えると古いお墓が自動的に削除されます。",\
                        }\
                    },\
                    {\
                        "text": "$(max)",\
                        "color": "aqua"\
                    }\
                ],\
                "\n\n",\
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
    "columns": 2,\
    "actions": $(actions) \
}