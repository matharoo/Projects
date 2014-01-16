import bb.cascades 1.0
import bb.system 1.0

MenuDefinition {
    id: appmenuPage
    helpAction: HelpActionItem {
        onTriggered: {
            quote.body = "[[ Just trigger the fire and the app displays random ideas. Don't expect more out of this, its just a fun app :p ]]"
            quote.show();
            
        }
    }
    
    actions: [
        ActionItem {
            title: "Credits"

            onTriggered: {
                quote.body = "[[ Copyright-2013 IdeaFire by Rupinder Matharoo ]]"
                quote.show();
            }
        }
    ]

    attachedObjects: [
        SystemToast {
            id: quote
            body: "Hello"
            position: BottomCenter
        }
    ]
}