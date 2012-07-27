---
comments: true
date: 2010-07-06 22:28:31
layout: post
slug: steam-auf-ubuntu-linux
title: Steam auf Ubuntu Linux
wordpress_id: 471
categories:
- General
tags:
- counter strike
- linux
- steam
- ubuntu
- wine
---

Counter Strike und viele andere Spiele sind auf Linux schon länger kein Problem mehr. In diesem Tutorial wird beschrieben, wie man Steam unter [Ubuntu](http://www.ubuntu.com/) Linux installiert.

Zunächst wird [Wine](http://www.winehq.org/) benötigt, um Windows Programme auszuführen:

Um die aktuelle Version von Wine zu installieren, werden der Reihe nach diese Befehle in das Terminal eingegeben:

    
    #Wine Quellen hinzufügen
    sudo add-apt-repository ppa:ubuntu-wine/ppa
    
    #Quellen aktualisieren
    sudo apt-get update
    
    #Wine installieren
    sudo apt-get install wine


Anschließend wird [winetricks](http://wiki.winehq.org/winetricks) installiert um Steam schnell und problemlos zu installieren zu können:

    
    
    wget http://www.kegel.com/wine/winetricks
    



Nun können wir Steam bequem über winetricks installieren:

    
    
    sh winetricks steam
    



Steam sollte nach der Installation problemlos funktionieren.
Für viele Steam Spiele, wie z.B. Counter Strike 1.6, werden übrigens die proprietären 3D Treiber der entsprechenden Hersteller benötigt.
