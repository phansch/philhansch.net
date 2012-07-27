---
comments: true
date: 2010-12-31 14:34:23
layout: post
slug: pillen-geister-und-elektromusik-teil-2
title: Pillen, Geister und Elektromusik – Teil 2
wordpress_id: 992
---

Ich habe wieder Zeit gefunden um an meinem [Pacman Spiel](Pillen, Geister und Elektromusik – Teil 1) weiter zu arbeiten.

[nggallery id=4]

Für den DirectX-Teil brauche ich eine Klasse um eine Map Datei zu öffnen. Diese war praktischerweise schon für den MapEditor geschrieben. Also habe ich die Klasse in ein Core-Projekt verschoben und setze diese nun für beide Programme ein.
Das hat den Vorteil dass es anstatt zwei ähnlicher Klassen nur eine gibt und somit weniger Sourcecode vorhanden ist (Stichwort: [refactoring](http://en.wikipedia.org/wiki/Code_refactoring)).

Im Grunde lässt sich die Klasse nun auch für andere Spiele verwenden die auf einem Raster basieren. 

So wären zum Beispiel Spiele wie [Schiffe Versenken](http://blog.phansch.de/2010/03/c-schiffe-versenken-uberlegungen/) durchaus mit diesem Grid realisierbar.


