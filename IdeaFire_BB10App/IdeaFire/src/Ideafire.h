/*
 * Ideafire.h
 *
 *  Created on: Jul 4, 2013
 *      Author: matharoo
 */

#ifndef IDEAFIRE_H_
#define IDEAFIRE_H_

#include <bb/cascades/Application>
#include "soundmanager.h"

class Ideafire: public QObject {
	Q_OBJECT

public:
	Ideafire();
	virtual ~Ideafire();

	Q_INVOKABLE
	  void playSound(const QString &msg);

	private:
	  // The sound manager
	  SoundManager *mSoundManager;
};

#endif /* IDEAFIRE_H_ */
