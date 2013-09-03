---
comments: true
date: 2010-11-04 22:20:31
layout: post
slug: pillen-geister-und-elektromusik
title: Pillen, Geister und Elektromusik - Teil 1
wordpress_id: 747
---

Ich arbeite zur Zeit an einem Pacman ähnlichen Spiel, welches auf C# und dem [XNA Framework](http://msdn.microsoft.com/en-us/library/ff402531(v=VS.92).aspx) basiert.

Das Spielfeld soll als Raster aufgebaut sein. Das Raster wird mithilfe einer Textdatei mit entsprechenden Shapes gefüllt. Um das erstellen der Textdatei zu vereinfachen, habe ich kurzerhand einen MapEditor für mein Spiel erstellt.

Die Map-Datei sieht so aus:

    
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1,
    1 3 2 2 2 2 2 2 2 2 2 2 2 3 1,
    1 2 1 2 1 1 1 2 1 2 1 1 1 2 1,
    1 2 1 2 1 0 1 2 1 2 2 2 1 2 1,
    1 2 1 2 1 0 0 2 1 2 1 2 2 2 1,
    1 2 2 2 1 1 1 2 1 2 1 1 1 2 1,
    1 2 1 2 2 2 2 2 2 2 2 2 2 2 1,
    1 2 1 1 2 1 1 1 1 2 1 1 1 2 1,
    1 3 2 2 2 2 2 2 2 2 2 2 2 3 1,
    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1,



Die Feldtypen:

    
    
            public enum FieldType
            {
                Empty = 0,
                Wall = 1,
                SmallPill = 2,
                BigPill = 3,
            }
    



Diese Datei wurde vorher mit dem Map Editor erstellt und gespeichert.
<!--[![](http://wpimages.phansch.de/2010/11/pacmanMapEditor1-300x156.png)](http://wpimages.phansch.de/2010/11/pacmanMapEditor1.png)-->

Als nächstes steht nun die Erstellung des Spielfeldes mithilfe des XNA Frameworks an.
