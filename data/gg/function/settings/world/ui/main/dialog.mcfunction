#> gg:settings/world/ui/main/dialog
# ダイアログを書いておく

$dialog show @s {\
    "type": "minecraft:confirmation",\
    "title": {\
        "text": "Gen Grave (ワールド設定)",\
        "color": "gold"\
    },\
    "body": [\
        {\
            "type": "minecraft:plain_message",\
            "contents": "この設定はプレイヤー全員に適用されます。"\
        }\
    ],\
    "inputs": [\
        {\
            "type": "minecraft:single_option",\
            "key": "keepExp",\
            "label": {\
                "text": "経験値を保持する",\
                "hover_event": {\
                    "action": "show_text",\
                    "value": "死亡時に所持していた経験値を減らさずに取得することができます。"\
                }\
            },\
            "options": [\
                {"id": "0", display: {"text": "いいえ", "color": "red"}, "initial": $(keepExpF)},\
                {"id": "1", display: {"text": "はい", "color": "green"}, "initial": $(keepExpT)}\
            ]\
        },\
        {\
            "type": "minecraft:single_option",\
            "key": "quickGet",\
            "label": {\
                "text": "クイック取得",\
                "hover_event": {\
                    "action": "show_text",\
                    "value": "死亡時に所持していたアイテムの配置を変えずに取得することができます。"\
                }\
            },\
            "options": [\
                {"id": "0", display: {"text": "いいえ", "color": "red"}, "initial": $(quickGetF)},\
                {"id": "1", display: {"text": "はい", "color": "green"}, "initial": $(quickGetT)}\
            ]\
        },\
        {\
            "type": "minecraft:single_option",\
            "key": "oneClick",\
            "label": {\
                "text": "ワンクリック",\
                "hover_event": {\
                    "action": "show_text",\
                    "value": "お墓を一回のクリックで壊せるようになります。"\
                }\
            },\
            "options": [\
                {"id": "0", display: {"text": "いいえ", "color": "red"}, "initial": $(oneClickF)},\
                {"id": "1", display: {"text": "はい", "color": "green"}, "initial": $(oneClickT)}\
            ]\
        },\
        {\
            "type": "minecraft:single_option",\
            "key": "posession",\
            "label": {\
                "text": "憑依",\
                "hover_event": {\
                    "action": "show_text",\
                    "value": "お墓へ憑依することで周辺の環境を見ることができます。"\
                }\
            },\
            "options": [\
                {"id": "0", display: {"text": "いいえ", "color": "red"}, "initial": $(posessionF)},\
                {"id": "1", display: {"text": "はい", "color": "green"}, "initial": $(posessionT)}\
            ]\
        },\
        {\
            "type": "minecraft:single_option",\
            "key": "tpGrave",\
            "label": {\
                "text": "テレポート",\
                "hover_event": {\
                    "action": "show_text",\
                    "value": "お墓へテレポートすることができます。"\
                }\
            },\
            "options": [\
                {"id": "0", display: {"text": "いいえ", "color": "red"}, "initial": $(tpGraveF)},\
                {"id": "1", display: {"text": "はい", "color": "green"}, "initial": $(tpGraveT)}\
            ]\
        },\
        {\
            "type": "minecraft:number_range",\
            "key": "graveMax",\
            "label": "お墓の保存上限",\
            "label_format": "%1$s：%2$s個",\
            "start": 1,\
            "end": 100,\
            "step": 1,\
            "initial": $(graveMax)\
        },\
        {\
            "type": "minecraft:single_option",\
            "key": "keepInventory",\
            "label": {\
                "text": "キープインベントリ",\
                "color": "red",\
                "hover_event": {\
                    "action": "show_text",\
                    "value": "ゲームルールの「keepInventory」と同じ挙動をするようになります。その際お墓の生成機能は無効になります。"\
                }\
            },\
            "options": [\
                {"id": "0", display: {"text": "いいえ", "color": "red"}, "initial": $(keepInventoryF)},\
                {"id": "1", display: {"text": "はい", "color": "green"}, "initial": $(keepInventoryT)}\
            ]\
        },\
    ],\
    "can_close_with_escape": true,\
    "yes": {\
        "label": {\
            "text": "決定"\
        },\
        "width": 150,\
        "action": {\
            "type": "minecraft:dynamic/run_command",\
            "template": "trigger gg.worldSetting set 1$(text)"\
        }\
    },\
    "no": {\
        "label": {\
            "text": "とじる"\
        },\
        "width": 50,\
        "action": {\
            "type": "minecraft:run_command",\
            "command": "trigger gg.worldSetting set 0"\
        }\
    }\
}
