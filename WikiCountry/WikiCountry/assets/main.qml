// Default empty project template
import bb.cascades 1.0
import bb.system 1.0

// creates one page with a label
NavigationPane {
    id: nav
    property string country
    
    onTopChanged: {
        if (page == wikiPage) {
            nav.setPeekEnabled(false);
        }
        else{
            nav.setPeekEnabled(true);
        }
    }
    
    
Page {
    Container {
        	
            topPadding: 20
        leftPadding: 40
        rightPadding: 40
        
        Label {
            text: "Country Wiki"
            onCreationCompleted: {
            }
            textStyle.fontSize: FontSize.XLarge
            textStyle.fontStyle: FontStyle.Italic
            textStyle {
                base: SystemDefaults.TextStyles.BodyText
                color: Color.Black
            }
        }
        
        TextField {
            id:search
            hintText: "Search"
                onTextChanging: {
                    filter(text);
                }
            }

        ListView {
            id: menus
                layout: StackListLayout {
                    headerMode: ListHeaderMode.Sticky
                }
                
                dataModel: XmlDataModel {
                id: xml_source
                source: "XML/list.xml"
            }

            listItemComponents: [
                    ListItemComponent {
                        type: "header"
                        Header {
                            title: ListItemData.key
                            
                        }
                    },                    
                ListItemComponent {
                    type : "country"
                    StandardListItem {
                        id: itemm
                        title: "<html><span style='color: #d1000000;'>"+ListItemData.name+"</span></html>"
                        
                    }
                }
            ]

            onTriggered: {
                    //console.log("index path is: ", indexPath);
                    var selectedItem = dataModel.data(indexPath);
                    //console.log("item selected value is: ",selectedItem.name);
                    country = selectedItem.name;
                    nav.push(wikiPage);
            }
        }// end of listview
    }
    onCreationCompleted: {
            console.log("here creation complete shuru!");
            var xmlContents = XML.LoadXML("list.xml", "country", "name"); // Call the C++ Method to load the XML data. 3 arguments: XML File, Row name, attribute name
            console.log("length is: ", xmlContents.length);
            for (var x = 0; x < xmlContents.length; x ++) {                
                console.log("Contry names are : "); // Needs to be an 'Option' before the DropDown will accept it                
            }
        }
}

attachedObjects: [
    Wikipage {
        id: wikiPage
    }
]

}