+++
comments = false
template = "post.html"
slug = "c-schiffe-versenken-uberlegungen"
title = "C# Schiffe Versenken - Ueberlegungen (Teil 1)"
wordpress_id = 209
aliases = ["2010/03/12/c-schiffe-versenken-uberlegungen/"]
+++

Vorwort: _Für diese Reihe wird Visual  C# Express 2008 oder [MonoDevelop](http://monodevelop.com/) benötigt. Screenshots, Codesnippets und Solutions werden vorerst nur  für Visual C# Express verfügbar sein.

[Schiffeversenken](http://de.wikipedia.org/wiki/Schiffe_versenken) ist ein tolles Spiel. Jeder kennt es und jeder mag es.
Da liegt es eigentlich nur nahe, das Spiel als Programmieraufgabe zu verwenden.

Wenn wir uns das Spiel genauer anschauen, stellen wir fest dass es vieles zu beachten gibt.
	
  * Die Spielfeldgröße
  * Art und Anzahl der verfügbaren Schiffe
  * Schwierigkeitsgrad des Computergegners
  * Verschiedene Spielvarianten

Mit ein bisschen Fantasie lässt sich das Spiel noch erweitern:

	
  * Sonar, zum aufdecken eines Feldes.
  * Radar, um festzustellen von wo gefeuert wurde.
  * Superwaffen, die mehrere Felder treffen.
  * Zeitliche Begrenzung

Zunächst werden wir nur ein einfache Version entwickeln, in der sich, abgesehen vom Schiffeversenken, nur die Spielfeldgröße ändern lässt.

Das erste was wir Programmieren werden ist also das Spielfeld.
