---
comments: true
date: 2010-03-20 15:38:04
layout: post
slug: linux-webserver-mit-virtualbox
title: Linux Webserver mit VirtualBox
wordpress_id: 159
---

Hier ein kleines Tutorial wie man einen Linux Webserver auf einer Virtuellen Maschine erstellt.

Es hat viele Nachteile, Projekte auf einem Produktivsystem zu entwickeln. Es macht daher Sinn, ein Testsystem aufzusetzen. Am sinnvollsten ist hier ein virtueller Webserver.

Als Software benutze benutzen wir VirtualBox und Ubuntu.

Das Hostsystem ist Windows 7 x64.

VirtualBox kann [hier](http://www.virtualbox.org/wiki/Downloads) heruntergeladen werden und das .iso Image für Ubuntu 9.10 [hier](http://www.ubuntu.com/GetUbuntu/download).

Die Installation und Konfiguration von VirtualBox ist zum Großteil selbsterklärend und die Schritte zum erstellen einer neuen Maschine sind sehr gut erläutert.

Für unseren Test-Webserver wird ein **20GB** Volume erstellt und **350 MB Arbeitsspeicher** zugewiesen.

Wenn die virtuelle Festplatte erstellt ist, muss man festlegen, dass die .iso Datei zum ersten Start eingebunden wird.

Dazu wählt man die zu ändernde Maschine aus und öffnet das Einstellungsmenü.

Dort lässt sich das entsprechende .iso image auswählen.

[![Einbindung des ISO Images](http://wpimages.phansch.de/2010/03/vbox-iso1-300x240.gif)](http://wpimages.phansch.de/2010/03/vbox-iso1.gif)

Danach wird die Maschine gestartet und Ubuntu kann installiert werden.

Bevor man sich an die Apache Installation macht, sollte man alle verfügbaren Updates installieren.

[![Xubuntu Updates](http://wpimages.phansch.de/2010/03/xubuntu-updates-300x247.gif)](http://wpimages.phansch.de/2010/03/xubuntu-updates.gif)

Wenn alle Updates erfolgreich installiert sind, sollte die Maschine neu gestartet werden.

Nun kann man den eigentlichen Webserver installieren.


## Apache
    
    sudo apt-get install apache2


Überprüft werden kann die apache Installation, indem man im Browser "localhost" eingibt. Wenn "It Works!" ausgegeben wird, war die Installation erfolgreich:

[![Apache wurde erfolgreich installiert](http://wpimages.phansch.de/2010/03/apache-it-works-300x247.gif)](http://wpimages.phansch.de/2010/03/apache-it-works.gif)


## PHP

    sudo apt-get install php5 libapache2-mod-php5


Jetzt den Apache neu starten um die Änderungen zu laden:

    
    sudo /etc/init.d/apache2 restart


Um zu überprüfen ob PHP erfolgreich installiert wurde geben wir folgendes in das Terminal ein:

    
    sudo gedit /var/www/info.php


In die Datei schreiben wir:

Nun die Datei speichern und im Browser mittels [http://localhost/info.php](http://localhost/info.php) aufrufen.

Es sollten nun umfangreiche Informationen über PHP im Browserfenster erscheinen. Wenn das klappt, funktioniert also der Apache und PHP auf unserem Ubuntu!


## MySQL


Weiter geht es mit MySQL.
    
    sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql

## phpMyAdmin

Installieren:
    
    sudo apt-get install phpmyadmin


Nachdem phpMyAdmin installiert wurde, lässt es sich über [http://localhost/phpmyadmin](http://localhost/phpmyadmin) aufrufen.


## Weiteres


Zu guter letzt noch ein paar nützliche Tipps im Umgang mit dem neuen Testsystem.


### Apache/MySql starten und beenden


Um Apache zu starten folgenden Befehl benutzen:

    
    sudo /etc/init.d/apache2 start


Zum beenden:

    
    sudo /etc/init.d/apache2 stop


Zum neustarten:

    
    sudo /etc/init.d/apache2 restart


Status ausgeben:

    
    sudo /etc/init.d/apache2 status


Für MySql einfach "apache2" durch "mysql" ersetzen.


### Speicherort der Dateien


In /var/www/ können jetzt die Dateien und Skripte abgelegt werden, die auf eurem Webserver verfügbar sein sollen.


### Userverzeichnisse


Jeder Nutzer hat die Möglichkeit in seinem Homeverzeichnis eigene Websites abzulegen.

Diese Websites lassen sich über http://localhost/~username abrufen.

By Default gibt es diese Möglichkeit leider nicht.

Zunächst erstellen wir in unserem Homeverzeichnis ein Verzeichnis mit dem Namen "public_html".

    
    cd
    mkdir public_html


Jetzt laden wir das Apache Modul userdir:

    
    sudo a2enmod userdir


Wobei _userdir_ der Name des Moduls ist und **nicht der Name des Userverzeichnisses**!
Nun muss der Apache neu gestartet werden damit die Änderungen angewandt werden.
