#include "XmlReader.h"

XmlReader::XmlReader() {
}

XmlReader::~XmlReader() {
}

const QString XmlBasePath = QDir::currentPath() + "/app/native/assets/XML/";				// Base path to the XML folder in your app

QVariantList XmlReader::LoadXML(QString xmlPath, QString rowType, QString attribute){
	//fprintf(stderr, "Hello calculate");
	// Setup the full path to the XML file
	//	And open a QFile for use by the XmlStreamReader
	QString XmlPath = XmlBasePath + xmlPath;
	QFile* XFile = new QFile(XmlPath);
	bool check= XFile->open(QIODevice::ReadOnly | QIODevice::Text);
	//fprintf(stderr, "%d",check);
	//fprintf(stderr, XmlPath.toStdString().c_str());
	// Initialize the XML reader with the XML file
	QXmlStreamReader Xml(XFile);

	//
	// This is where the magic happens: Read the Attributes off of each entry entry and return a QList of Name/Value pairs
	QList< QVariantMap > Entries;
	while(!Xml.atEnd()){
		QXmlStreamReader::TokenType Token = Xml.readNext();

		if(Token == QXmlStreamReader::StartElement){
			fprintf(stderr, Xml.name().toString().toStdString().c_str());
			fprintf(stderr, rowType.toStdString().c_str());
			if(Xml.name() == rowType) {
				// If this is an xml element that is named correctly, try to read the attributes
				QXmlStreamAttributes attributes = Xml.attributes();

				QVariantMap Entry;
				Entry[attribute] = attributes.value(attribute).toString();
				fprintf(stderr, attributes.value(attribute).toString().toStdString().c_str());
				Entries.append(Entry);
			}
		}
	}

	// Cleanup file handle
	XFile->close();

	// Debug view
	qDebug() << "stuff coming" << Entries;


	// Convert to QVariantList for transfer to QML
	QVariantList QVList;
	for(int i = 0; i < Entries.length(); i++){
		QVariantMap map;
		QVList << Entries[i];
	}

	return QVList;
}
