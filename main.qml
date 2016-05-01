import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.XmlListModel 2.0

ApplicationWindow {
    visible: true
    id: root
    width: 640
    minimumWidth: mainToolbar.implicitWidth
    height: 480
    title: qsTr("Hello World")

    toolBar: ToolBar {
        id: mainToolbar
        RowLayout {
            width: parent.width
            ToolButton{
                text: "Hier bin ich"
                iconSource: "icons/icons/wheely.png"
                onClicked: root.color = "red"
            }
            ToolButton{
                text: "Hier bin ich"
                onClicked: root.color = "blue"
            }
            ToolButton{
                text: "Hier bin ich"
                onClicked: root.color = "yellow"
            }
            ToolButton{
                text: "Hier bin ich"
                onClicked: root.color = "green"
            }
            Slider{
                Layout.fillWidth: true
                value: 50
                maximumValue: 100
            }
            TextField{
                id: searchText
            }
        }
    }
    /*ExclusiveGroup{
        id: group
    }

    GroupBox {
        title: "Groupbox"
        anchors.centerIn: parent
        ColumnLayout {
            RadioButton {
                 text: "Chooser1"
                 exclusiveGroup: group
            }
            RadioButton {
                 text: "Choose2"
                 exclusiveGroup: group
            }
            RadioButton {
                 text: "Choose3"
                 exclusiveGroup: group
            }
            RadioButton {
                 text: "Choose4"
                 exclusiveGroup: group
            }
        }
    }*/
    SplitView {
        anchors.fill: parent
        TableView {
            frameVisible: false
            XmlListModel {
                id:flickerModel
                source:"https://api.flickr.com/services/feeds/photos_public.gne?format=rss2&tags="+searchText.text
                query: "/rss/channel/item"
                namespaceDeclarations: "declare namespace media=\"http://search.yahoo.com/mrss/\";"
                XmlRole{ name: "title";  query: "title/string()"}
                XmlRole{ name: "source"; query: "media:content/@url/string()" }

            }

            id:tableList
            model: flickerModel
            TableViewColumn{
                title: "Table Column"
                role: "title"
            }

        }
        Image {
            fillMode: Image.PreserveAspectFit
            id: imageView
            source: flickerModel.get(tableList.currentRow).source

        }
    }

    statusBar: StatusBar {
        RowLayout{
            width: parent.width
            Label {
                Text{
                    text: imageView.source
                }
                Layout.fillWidth: true
                elide: Text.ElideMiddle
            }
            ProgressBar {
                value: imageView.progress
            }
        }
    }

}
