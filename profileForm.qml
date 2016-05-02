import QtQuick 2.5
import QtQuick.Controls 1.4

TextField{
    id:textfield
    Binding {
        target: profileData
        property: "name"
        value: textfield.text
    }
    Connections {
        target: profileData
        onNameChanged: console.log("The application data changed to:"+profileData.name);
    }
}
