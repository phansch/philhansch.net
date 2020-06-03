---
comments: true
date: 2010-12-31 14:34:23
layout: post
slug: pillen-geister-und-elektromusik-teil-2
title: Pillen, Geister und Elektromusik - Teil 2
wordpress_id: 992
aliases: [""]
---

Ich habe wieder Zeit gefunden um an meinem [Pacman Spiel](http://phansch.net/2010/11/04/pillen-geister-und-elektromusik) weiter zu arbeiten.

Für den DirectX-Teil brauche ich eine Klasse um eine Map Datei zu öffnen. Diese war praktischerweise schon für den MapEditor geschrieben. Also habe ich die Klasse in ein Core-Projekt verschoben und setze diese nun für beide Programme ein.
Das hat den Vorteil dass es anstatt zwei ähnlicher Klassen nur eine gibt und somit weniger Sourcecode vorhanden ist (Stichwort: [refactoring](http://en.wikipedia.org/wiki/Code_refactoring)).

Im Grunde lässt sich die Klasse nun auch für andere Spiele verwenden die auf einem Raster basieren. 

So wären zum Beispiel Spiele wie [Schiffe Versenken](http://phansch.net/2010/03/12/c-schiffe-versenken-uberlegungen) durchaus mit diesem Grid realisierbar.


