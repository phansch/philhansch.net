---
comments: true
date: 2009-11-07 14:03:23
layout: post
slug: windows-7-netzlaufwerke-nach-neustart-getrennt
title: Windows 7 - Netzlaufwerke nach Neustart getrennt
wordpress_id: 180
---

Dank MSDNAA bin ich nun im Besitz von Windows 7 Professional.

Nun, vor kurzem habe ich mir ein NAS von Iomega zugelegt. Leider ist bisher noch kein offizieller Treiber für Windows 7 x64 erschienen.

Also blieb mir nur die manuelle Methode:

**Computer -> Netzlaufwerk verbinden**

[![Netzlaufwerk Verbinden](http://wpimages.phansch.de/2009/11/netzlaufwerk-verbinden-300x28.jpg)](http://wpimages.phansch.de/2009/11/netzlaufwerk-verbinden.jpg)

Nach einem Neustart kam jedoch folgende Nachricht:
_"Netzlaufwerk konnte nicht wiederhergestellt werden"_

Das Problem ist warscheinlich, dass die Netzwerkdienste zu spät gestartet werden. Mit Windows XP hat Microsoft versucht, den Systemstart zu beschleunigen und dabei die Netzwerkdienste zu niedrig priorisiert.

Es gibt aber zwei Lösungen die für mich funktioniert haben.


### Anmeldung herauszögern


Der Gedanke hierbei ist, dass die Netzwerkdienste vor der Anmeldung starten können. Man wartet 15 bis 20 Sekunden bevor man das Nutzerpasswort eingibt und sich anmeldet.

Wem das Warten nicht gefällt, den kann ich beruhigen.


### Batchdatei zum Einbinden der Netzlaufwerke im Autostart


Der Autostart ist so ziemlich der letzte Teil beim Start von Windows. Die Netzwerkdienste sind vor dem Autostart verfügbar.

Mit einer kleinen Batchdatei lassen sich sich die Netzwerkordner einbinden.

    
    net use W: \\nas-server\public passwort /user:kontoname /Persistent:NO
    net use X: \\nas-server\backups /Persistent:NO
    net use Y: \\nas-server\itunes /Persistent:NO
    net use Z: \\nas-server\web /Persistent:NO


Bei der ersten Ressource werden die Logininformationen angegeben.
Außerdem wird für jedes Netzlaufwerk Persistent auf "NO" gesetzt. Das heißt, das die Netzlaufwerke nur für eine Sitzung existieren. So sparen wir uns das manuelle Trennen der Netzlaufwerke.

Nun muss die Batchdatei noch in den Autostart-Ordner gespeichert werden.
