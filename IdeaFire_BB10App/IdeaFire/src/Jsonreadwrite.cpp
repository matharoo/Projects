/*
 * Jsonreadwrite.cpp
 *
 *  Created on: Jun 19, 2013
 *      Author: rmatharoo
 */
#include "stdio.h"
#include "Jsonreadwrite.h"
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/data/JsonDataAccess>

using namespace bb::cascades;
using namespace bb::data;

Jsonreadwrite::Jsonreadwrite()
{
	// TODO Auto-generated constructor stub

}

Jsonreadwrite::~Jsonreadwrite() {
	// TODO Auto-generated destructor stub
}

int Jsonreadwrite::value()
{
	return m_iValue;
}

void Jsonreadwrite::setValue(int i)
{
	m_iValue = i;
	emit valueChanged(m_iValue);
}

void Jsonreadwrite::reset()
{
    m_iValue = 0;
    emit valueChanged(m_iValue);
}

Q_DECL_EXPORT QString Jsonreadwrite::jsonreadlogin(QString attribute)
{
	JsonDataAccess jda_read;
	QString home = QDir::currentPath();
	int random_number= rand() % 28;
	QFile file(home+"/app/native/assets/ideas/ideas.json");
	if(file.exists())
	{
		QVariant json = jda_read.load(home+"/app/native/assets/ideas/ideas.json");
		if(attribute=="quote"){
			QString displayText = json.toList().at(random_number).toMap().value("quote").toString();
			return displayText;
		}
	}
	else{
		return "NULL";
	}
}



