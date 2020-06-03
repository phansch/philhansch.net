---
comments: true
date: 2011-09-17 09:00:40
layout: post
slug: pillen-geister-und-elektromusik-teil-3
title: Pillen, Geister und Elektromusik - Teil 3
wordpress_id: 1013
---

In den letzten zwei Wochen habe ich wieder Zeit für das [Pacman Spiel](http://phansch.net/2010/12/31/pillen-geister-und-elektromusik-teil-2) gefunden.
Es hat sich einiges getan. Unter anderen verfügen die Geister nun über eine automatische Wegfindung. Außerdem können sie von Pacman durch das Sammeln von großen Pillen für 5 Sekunden verlangsamt werden. Was es sonst noch neues gibt, erfahrt ihr hier

### Geister "AI"

Die Geister Wegfindung ist sehr einfach gehalten.
Befindet sich ein Geist auf einer Kreuzung, wird eine zufällige Richtung ausgewählt. Ausgenommen ist dabei die Richtung aus der der Geist gekommen ist.

{% highlight csharp %}
public void GetPossibleDirections(Map map)
{
    _possibleDirections.Clear();
    foreach (Direction dir in Enum.GetValues(typeof(Direction)))
    {
        if (CanMove(dir, map))
        {
            _possibleDirections.Add(dir);
        }
    }

    //Remove the opposite direction
    if (this.CurrentDirection == Direction.Right)
    {
        _possibleDirections.Remove(Direction.Left);
    }
    else if (this.CurrentDirection == Direction.Left)
    {
        _possibleDirections.Remove(Direction.Right);
    }
    else if (this.CurrentDirection == Direction.Up)
    {
        _possibleDirections.Remove(Direction.Down);
    }
    else if (this.CurrentDirection == Direction.Down)
    {
        _possibleDirections.Remove(Direction.Up);
    }
}
{% endhighlight %}
Natürlich ist das noch keine große Herausforderung für den Spieler. Im Original hat jeder Geist seine eigene Persönlichkeit, so dass er zum Beispiel auf die Nähe Pacmans reagiert. 
Dazu gibt es einige wunderbare Artikel im Netz:
	
* [Gamasutra](http://www.gamasutra.com/view/feature/3938/the_pacman_dossier.php?print=1)
* [http://gameinternals.com/post/2072558330/understanding-pac-man-ghost-behavior](http://gameinternals.com/post/2072558330/understanding-pac-man-ghost-behavior)

Ich werde wenigstens eine Alternative Wegfindung für die Gegner implementieren. 

### Collision Detection

<!--![](http://wpimages.phansch.de/2011/09/collisionDetection_1.jpg)-->

Die erstbeste Methode zur Kollisionserkennung auf die man stößt wenn man nach "XNA collision detection" recherchiert, ist `Rectangle.Intersects(Rectangle r)`. Wenn sich Rechteck A mit Rechteck B treffen hat man eine Kollision. Hier stoßen wir beim Spielen aber früher oder später auf Schwierigkeiten.

<!--![](http://wpimages.phansch.de/2011/09/collisionDetection_2.jpg) -->

Anhand des Bildes kann man das leicht erklären. Der Gegner (rot) befindet sich auf dem Weg nach oben und ist Pacman schon fast ein ganzes Feld voraus. Da sich jedoch die Rechtecke beider Objekte berühren, kommt es zur Kollision.

{% highlight csharp %}
public bool GetsEaten_Hardcore(List<ghost>)
{
    foreach (Ghost g in ghosts)
    {
        if (this.RectBoundary.Intersects(g.RectBoundary))
        {
            return true;
        }
    }
    return false;
}
{% endhighlight %}

Eine andere Möglichkeit: Während des Spiels wird von der Spielfigur und den Gegnern jeweils das aktuelle Feld erfasst. Befindet sich ein Geist mit Pacman auf demselben Feld, kommt es zu einer Kollision.

{% highlight csharp %}
public bool GetsEaten_Liberal(List<ghost>)
{
    foreach (Ghost g in ghosts)
    {
        if (this.CurrentField == g.CurrentField)
        {
            return true;
        }
    }
    return false;
}
{% endhighlight %}



<!--![](http://wpimages.phansch.de/2011/09/collisionDetection_3.jpg)-->

Nun, damit entsteht ein Problem: Was passiert wenn sich Pacman und Gegner (rot) auf demselben Feld sind, sich aber nicht berühren? Genau: Die Methode gibt _true_ zurück und der Spieler hat ein Leben weniger.
Einen optimalen Lösungsweg habe ich hiermit noch nicht gefunden. Ich werde mich nochmals mit der letzteren Methode beschäftigen, da die erste Methode zu frustrierend für den Spieler wäre. Immerhin kann der Spieler die Bounding Rectangles nicht sehen.



### Verlangsamung der Gegner

In der jetzigen Version kann Pacman die Gegner für eine bestimmte Zeit verlangsamen indem er eine große Pille sammelt. Ist die festgelegte Zeit abgelaufen, haben die Gegner wieder ihre ursprüngliche Geschwindigkeit.

Alles fängt damit an, dass Pacman eine große Pille sammelt:
{% highlight csharp %}
if ((pointsGained = _pacman.EatBigPill(_map) == 30)
{
    GameData.AteBigPill = true;
}
{% endhighlight %}

Die Methode `Update_Ghosts()` überprüft ob `GameData.AteBigPill == true` ist und ändert entsprechend die Geschwindigkeit der Gegner.
{% highlight csharp %}
//Slow each ghost for GHOST_SLOWTIME in seconds if pacman ate a big pill
if (GameData.AteBigPill == true)
{
    //Start counter
    GameData.GhostSlowTimer -= gameTime.ElapsedGameTime.TotalSeconds;
    foreach (Ghost g in _ghostList)
    {
        g.Speed = MovingCreature.MovementSpeed.Slow; //Force effect on each ghost
    }

    if (GameData.GhostSlowTimer < = 0) //if time is over
    {
        GameData.GhostSlowTimer = GameData.GHOST_SLOWTIME; //reset timer
        GameData.AteBigPill = false; //reset flag
    }
}
else if(GameData.AteBigPill == false)
{
    foreach (Ghost g in _ghostList)
    {
        g.Speed = MovingCreature.MovementSpeed.Fast; //Remove effect
    }
}
{% endhighlight %}
