#> gg:settings/player/ui/graves/delete/dialog
# 削除確認ページ

$dialog show @s {\
    "type": "minecraft:confirmation",\
    "title": {\
        "text": "Gen Grave (個人設定)"\
    },\
    "body": [\
        {\
            "type": "minecraft:plain_message",\
            "contents": {\
                "text": "$(name)",\
                "color": "aqua",\
                "bold": true\
            }\
        },\
        {\
            "type": "minecraft:plain_message",\
            "contents": [\
                "を",\
                {\
                    "text": "削除",\
                    "color": "red",\
                    "bold": true\
                },\
                "しようとしています。"\
            ]\
        },\
        {\
            "type": "minecraft:plain_message",\
            "contents": {\
                "text": "本当によろしいですか？",\
                "color": "red",\
                "bold": true,\
                "underlined": true\
            }\
        }\
    ],\
    "can_close_with_escape": true,\
    "pause": false,\
    "after_action": "none",\
    "yes": {\
        "label": {\
            "text": "はい",\
            "color": "red",\
            "bold": true\
        },\
        "tooltip": "お墓を削除します",\
        "width": 150,\
        "action": {\
            "type": "minecraft:run_command",\
            "command": "trigger gg.playerSetting set 19$(id)"\
        }\
    },\
    "no": {\
        "label": {\
            "text": "いいえ"\
        },\
        "width": 50,\
        "action": {\
            "type": "minecraft:run_command",\
            "command": "trigger gg.playerSetting set 10$(id)"\
        }\
    }\
}
