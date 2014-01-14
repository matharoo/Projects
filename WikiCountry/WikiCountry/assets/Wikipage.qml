import bb.cascades 1.0
/*
 * 
 */

Page {
    id: wikiPage
    property string fullurl
    property string code
    ScrollView {
        id: scrollView
        scrollViewProperties {
            scrollMode: ScrollMode.Vertical
            pinchToZoomEnabled: false
        }
        layoutProperties: StackLayoutProperties {
            spaceQuota: 1.0
        }

        Container {      
        WebView {
            id: web
            url: "http://en.wikipedia.org/wiki/"+nav.country
        }
            
        
    }
        
}
    paneProperties: NavigationPaneProperties {
        backButton: {
            
        }
    }
}
