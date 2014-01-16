/*
 * Jsonreadwrite.h
 *
 *  Created on: Jun 19, 2013
 *      Author: rmatharoo
 */

#ifndef JSONREADWRITE_H_
#define JSONREADWRITE_H_
#include <QObject>
#include <QMetaType>
#include <string.h>
#include <bb/cascades/AbstractPane>

class Jsonreadwrite : public QObject {
    Q_OBJECT
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)

public:
	Jsonreadwrite();
	virtual ~Jsonreadwrite();

    Q_INVOKABLE void reset();
    Q_INVOKABLE QString jsonreadlogin(QString attribute);
    int value();
    void setValue(int i);

signals:
    void valueChanged(int);

private:
    int m_iValue;
    bb::cascades::AbstractPane* _root;
};

#endif /* JSONREADWRITE_H_ */
