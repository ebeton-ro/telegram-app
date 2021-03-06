import QtQuick 2.0
import "../js/colors.js" as TelegramColors

Rectangle {
    property alias text: buttonLabel.text
    property alias textColor: buttonLabel.color
    property color backgroundColor: TelegramColors.blue

    signal clicked

    id:telegramBtn
    width: buttonLabel.width + units.gu(5)
    height: buttonLabel.height + units.gu(2)
    color: enabled ? backgroundColor : TelegramColors.grey
    radius: 3

    Behavior on color {
        ColorAnimation {
            duration: 300
        }
    }

    Text {
        id: buttonLabel
        anchors.centerIn: parent
        horizontalAlignment: TextInput.AlignHCenter
        verticalAlignment: TextInput.AlignVCenter

        color: TelegramColors.white
        font.pixelSize: FontUtils.sizeToPixels("large")
    }

    MouseArea {
        id: startMessaging
        anchors.fill: parent

        onPressed: parent.onPressed()
        onReleased: parent.onReleased()
        onClicked: parent.clicked()
    }

    onEnabledChanged:{
        if (!enabled) {
            telegramBtn.color = TelegramColors.grey;
        } else {
            telegramBtn.color = backgroundColor;
        }
    }

    function onPressed() {
        color = TelegramColors.dark_blue;
    }

    function onReleased() {
        color = TelegramColors.blue
    }
}
