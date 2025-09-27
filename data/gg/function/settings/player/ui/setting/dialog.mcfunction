#> gg:settings/player/ui/setting/dialog
# ダイアログを書いておく

$dialog show @s {\
    "type": "minecraft:confirmation",\
    "title": {\
        "text": "Gen Grave (個人設定)"\
    },\
    "body": [\
        {\
            "type": "minecraft:plain_message",\
            "contents": {\
                "text": "※お墓に表示されるアイテムは\n一部のみ表示されます。",\
                "color": "white"\
            }\
        }\
    ],\
    "inputs": [\
        {\
            "type": "minecraft:single_option",\
            "key": "othersBreaking",\
            "label": "他プレイヤーがお墓を破壊",\
            "options": [\
                {\
                    "id": "0",\
                    "display": {\
                        "text": "不可",\
                        "color": "red"\
                    },\
                    "initial": $(othersBreakingF)\
                },\
                {\
                    "id": "1",\
                    "display": {\
                        "text": "可",\
                        "color": "green"\
                    },\
                    "initial": $(othersBreakingT)\
                }\
            ]\
        },\
        {\
            "type": "minecraft:single_option",\
            "key": "",\
            "width": 120,\
            "label": "",\
            "label_visible": false,\
            "options": [\
                {\
                    "id": "",\
                    "display": {\
                        "text": "お墓に表示する情報"\
                    },\
                    "initial": true\
                }\
            ]\
        },\
        {\
            "type": "minecraft:boolean",\
            "key": "exp",\
            "label": {\
                "text": "経験値"\
            },\
            "initial": $(exp),\
            "on_true": "1",\
            "on_false": "0"\
        },\
        {\
            "type": "minecraft:boolean",\
            "key": "item",\
            "label": {\
                "text": "アイテム*"\
            },\
            "initial": $(items),\
            "on_true": "1",\
            "on_false": "0"\
        }\
    ],\
    "can_close_with_escape": true,\
    "pause": false,\
    "after_action": "none",\
    "yes": {\
        "label": {\
            "text": "決定"\
        },\
        "width": 150,\
        "action": {\
            "type": "minecraft:dynamic/run_command",\
            "template": "trigger gg.playerSetting set 1$(text)"\
        }\
    },\
    "no": {\
        "label": {\
            "text": "戻る"\
        },\
        "width": 50,\
        "action": {\
            "type": "minecraft:run_command",\
            "command": "trigger gg.playerSetting set 1"\
        }\
    }\
}
