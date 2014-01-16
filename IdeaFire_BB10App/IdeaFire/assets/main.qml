// Default empty project template
import bb.cascades 1.0
import bb.system 1.0

// creates one page with a label
Page {
    property string quotetext
    property variant menu
    Menu.definition: menu
    onCreationCompleted: {
        menu = appMenu.createObject();
    }
    Container {
        /*
        onTouch: {
            if (event.isDown()) {
                console.log("event windowX container: ", event.windowX);
                ontouchevent.text = "touchX: " + event.windowX + "  touchY: " + event.windowY
            }
        }
        */

        layout: AbsoluteLayout {
        }

        // Background ImageView
        ImageView {
            imageSource: "asset:///images/back.png"

            // If we touch the background, we want to play a "moo" sound.
            onTouch: {
                if (event.isDown()) {
                    //cowbellApp.playSound("moo.wav");
                }
            }
            scaleY: 1.1
        }
        Label {
            id: title 
            text: "Touch the GUN and fire some IDEAS !!"
            textStyle.fontSize: FontSize.XLarge
            textStyle.fontStyle: FontStyle.Italic
            translationX: 250.0
            translationY: 10.0

        }

        Label {
            id: quote
            text: ""
            textStyle.fontSize: FontSize.XSmall
            textStyle.fontStyle: FontStyle.Default
            translationX: 60.0
            translationY: 650.0
            textStyle.fontWeight: FontWeight.Default

        }
        /*
        Label {
            id: ontouchevent
            text: ""
            textStyle.fontSize: FontSize.XSmall
            translationY: 730.0
        }
        */
        
        
        ImageView {
            id: bell
            imageSource: "asset:///images/gun.png"
            preferredWidth: 800
            preferredHeight: 449
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 500.1
                positionY: 200.0
            }

            // The bell should rotate around a point located in the middle of
            // the image in X-direction and located somewhere above the screen
            // in Y-direction (it hangs around the neck of the cow which is not visible).
            // If the center is not altered all rotation animations will be around
            // the middle of the image.
            pivotY: 0

            // The bell is initially hidden.
            rotationZ: 2

            // We need two animations: one to swing to the left and one to swing to the right.
            animations: [
                // Left
                SequentialAnimation {
                    id: animLeft
                    animations: [
                        RotateTransition {
                            toAngleZ: -15
                            duration: 200
                            easingCurve: StockCurve.QuadraticInOut
                        },
                        RotateTransition {
                            toAngleZ: 0
                            duration: 300
                            easingCurve: StockCurve.QuadraticInOut
                        }
                    ]
                },
                // Right
                SequentialAnimation {
                    id: animRight
                    animations: [
                        RotateTransition {
                            toAngleZ: 30
                            duration: 200
                            easingCurve: StockCurve.QuadraticInOut
                        },
                        RotateTransition {
                            toAngleZ: 0
                            duration: 300
                            easingCurve: StockCurve.QuadraticInOut
                        }
                    ]
                }

            ]

            // Touch handler for the bell image
            onTouch: {
                if (event.isDown()) {
                    console.log("event windowX anywhere: ", event.windowX);
                    // Do not trigger the bell sound if the touch occurred on the image, but outside the
                    // actual bell (above or below).
                    if (event.windowY > 140 && event.windowY < (preferredHeight - 60)) {

                        // Play the sound.
                        Ideafire.playSound("gun.wav");

                        // If the image is hit on the left side, swing it to the right.
                        if (event.windowX < bell.layoutProperties.positionX + preferredWidth / 2) {
                            console.log("event windowX: ", event.windowX);
                            // Stop the animation before playing it to stop the moving bell and
                            // run the animation from that position
                            animLeft.stop();
                            animLeft.play();
                            quotetext = jsonObject.jsonreadlogin("quote");
                            quote.text = "\""+quotetext+"\"";
                        } else {
                            // And vice-versa for the right side.
                            animRight.stop();
                            animRight.play();
                            quotetext = jsonObject.jsonreadlogin("quote");
                            quote.text = "\"" + quotetext + "\"";
                        }
                    }
                }
            } // Touch handler for bell image

            onCreationCompleted: {
                // When the Control has been created run the intro animation.
                animIntro.play();
            } // Creation complete handler
        } // ImageView
    }
    attachedObjects: [
        ComponentDefinition {
            id: appMenu
            source: "Appmenu.qml"
        }
    ]// Content Container
}

