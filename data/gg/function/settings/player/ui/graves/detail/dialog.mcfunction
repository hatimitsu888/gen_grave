#> gg:settings/player/ui/graves/detail/dialog
# ダイアログを設定

$dialog show @s {\
    "type": "minecraft:multi_action",\
    "title": {\
        "text": "Gen Grave (個人設定)"\
    },\
    "body": [\
        {\
            "type": "minecraft:plain_message",\
            "contents": {\
                "text": "$(name)",\
                "color": "green",\
                "underlined": true\
            }\
        },\
        {\
            "type": "minecraft:plain_message",\
            "contents": [\
                {\
                    "text": "ディメンション\n",\
                    "bold": true\
                },\
                {\
                    "text": "$(dimension)",\
                    "color": "aqua",\
                    "bold": false\
                }\
            ]\
        },\
        {\
            "type": "minecraft:plain_message",\
            "contents": [\
                {\
                    "text": "死亡地点\n",\
                    "bold": true\
                },\
                [\
                    {\
                        "text": "X:",\
                        "bold": false\
                    },\
                    {\
                        "text": "$(x)",\
                        "color": "aqua"\
                    },\
                    {\
                        "text": "  Y:"\
                    },\
                    {\
                        "text": "$(y)",\
                        "color": "aqua"\
                    },\
                    {\
                        "text": "  Z:"\
                    },\
                    {\
                        "text": "$(z)",\
                        "color": "aqua"\
                    }\
                ]\
            ]\
        },\
        {\
            "type": "minecraft:plain_message",\
            "contents": [\
                {\
                    "text": "経験値\n",\
                    "bold": true\
                },\
                [\
                    {\
                        "text": "$(xpL)",\
                        "color": "aqua",\
                        "bold": false\
                    },\
                    {\
                        "text": "レベル  ",\
                        "color": "white"\
                    },\
                    {\
                        "text": "$(xpP)"\
                    },\
                    {\
                        "text": "ポイント",\
                        "color": "white"\
                    }\
                ]\
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
            "command": "trigger gg.playerSetting set 10"\
        }\
    },\
    "columns": 4,\
    "actions": [\
        {\
            "label": {\
                "text": "インベントリ"\
            },\
            "tooltip": "死亡時のインベントリを確認できます。",\
            "width": 120,\
            "action": {\
                "type": "minecraft:run_command",\
                "command": "trigger gg.playerSetting set 12$(id)"\
            }\
        },\
        {\
            "label": {\
                "text": "憑依"\
            },\
            "tooltip": "お墓の周辺を確認することができます。",\
            "width": 40,\
            "action": {\
                "type": "minecraft:run_command",\
                "command": "trigger gg.playerSetting set 13$(id)"\
            }\
        },\
        {\
            "label": "",\
            "width": 10\
        },\
        {\
            "label": "",\
            "width": 30\
        },\
        {\
            "label": {\
                "text": "テレポート"\
            },\
            "tooltip": "お墓にテレポートできます。",\
            "width": 120,\
            "action": {\
                "type": "minecraft:run_command",\
                "command": "trigger gg.playerSetting set 14$(id)"\
            }\
        },\
        {\
            "label": {\
                "text": "発光"\
            },\
            "tooltip": {\
                "text": "お墓を20秒間発光させます。"\
            },\
            "width": 40,\
            "action": {\
                "type": "minecraft:run_command",\
                "command": "trigger gg.playerSetting set 15$(id)"\
            }\
        },\
        {\
            "label": "",\
            "width": 10\
        },\
        {\
            "label": {\
                "text": "削除",\
                "color": "red"\
            },\
            "tooltip": "お墓を削除します。",\
            "width": 30,\
            "action": {\
                "type": "minecraft:run_command",\
                "command": "trigger gg.playerSetting set 19$(id)"\
            }\
        }\
    ]\
}
