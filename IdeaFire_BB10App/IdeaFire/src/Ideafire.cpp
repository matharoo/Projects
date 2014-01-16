/*
 * Ideafire.cpp
 *
 *  Created on: Jul 4, 2013
 *      Author: matharoo
 */

#include "Ideafire.h"
#include <bb/cascades/Page>
#include <bb/cascades/QmlDocument>

#include <bb/data/JsonDataAccess>
#include "Jsonreadwrite.h"
using namespace bb::cascades;
using namespace bb::data;

Ideafire::Ideafire() {
	  QmlDocument *qml = QmlDocument::create("asset:///main.qml");

	    Jsonreadwrite *jsonObject = new Jsonreadwrite();
	    qDebug() << "File not main found!";
	    	qml->setContextProperty("jsonObject", jsonObject);
	    	AbstractPane *root = qml->createRootObject<AbstractPane>();


	  // If the QML document is valid, we process it.
	  if (!qml->hasErrors()) {

	    // Create the application Page from QMLDocument.
	    Page *appPage = qml->createRootObject<Page>();

	    if (appPage) {

	      // Set the context property we want to use from inside the QML document. Functions exposed
	      // via Q_INVOKABLE will be found with this property and the name of the function.
	    	//IdeaFire is the class name
	      qml->setContextProperty("Ideafire", this);

	      // Initialize the sound manager with a directory that resides in the
	      // assets directory which only contains playable files.
	      mSoundManager = new SoundManager("sounds/");

	      // Set the main scene for the application to the Page.
	      Application::instance()->setScene(appPage);

	    }
	  }
}

Ideafire::~Ideafire() {
	// Destroy the sound manager.
	  delete mSoundManager;
}

void Ideafire::playSound(const QString &msg)
{
  // Play sound determined by QString parameter
  mSoundManager->play(msg);
}

