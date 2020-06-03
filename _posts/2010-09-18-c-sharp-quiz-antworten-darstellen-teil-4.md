---
comments: true
date: 2010-09-18 16:51:41
layout: post
slug: c-sharp-quiz-antworten-darstellen-teil-4
title: C# Quiz - Antworten darstellen (Teil 4)
wordpress_id: 311
---

Nachdem wir die [Fragen anzeigen lassen](http://phansch.net/2010/07/22/c-sharp-quiz-fragen-auslesen-teil-3) können, werden wir uns jetzt um die Antworten kümmern.

Die Antworten sind ebenfalls im .xml Format gespeichert:

    
{% highlight csharp %}
<antworten>
  <antwort id="1">Fast immer</antwort>
  <antwort id="2">Oft</antwort>
  <antwort id="3">Manchmal</antwort>
  <antwort id="4">Ganz selten</antwort>
</antworten>
{% endhighlight %}

Genauso wie die Fragen, sollen sich die Antworten anpassen und erweitern lassen.


## Die Klasse _Answers_


Im letzten Teil haben wir die Basisklasse _QuizXml_ erstellt. Diese können wir jetzt wieder für die Antworten verwenden.
Das Grundgerüst sieht so aus:

{% highlight csharp %}
class Answers : QuizXml
{
    private string[] str_answers;
    private RadioButton[] rdb_answers;

    /// <summary>
    /// Constructor
    /// </summary>
    public Answers() { }

    /// <summary>
    /// Returns an array of RadioButton Controls
    /// </summary>
    public RadioButton[] ArrAnswers { }

    private void ToRadioButton() { }
}
{% endhighlight %}

Der Konstruktor der abgeleiteten Klasse _Answers_ legt sämtliche Properties fest und ruft die Methode _PopulateArray()_ auf. Außerdem wird das Array initialisiert und selbiges in RadioButtons konvertiert.

{% highlight csharp %}
public Answers()
{
    base.arr_data = new string[1];
    base.Path = "Antworten.xml";
    base.xmlElement = "antworten";
    base.xmlSub = "antwort";

    base.PopulateArray();

    this.str_answers = base.arr_data;

    this.ToRadioButton();
}
{% endhighlight %}

Neu ist eigentlich nur die Methode _ToRadioButton()_:

{% highlight csharp %}
private void ToRadioButton()
{
    rdb_answers = new RadioButton[base.Count];
    int index = 0;
    foreach (string answer in str_answers)
    {
        rdb_answers[index] = new RadioButton();
        rdb_answers[index].Name = "rdb_" + index;
        rdb_answers[index].Text = answer;
        rdb_answers[index].Top = 40 + (index * 30);
        rdb_answers[index].Left = 20;
        index++;
    }
}
{% endhighlight %}

Hier wird für jede vorhandene Antwort ein neuer _RadioButton_ erzeugt. Außerdem wird ein _EventHandler_ für das _Click_-Event festgelegt.

Die Eigenschaft _ArrAnswers_ gibt das komplette RadioButton Array zurück:

    
{% highlight csharp %}
/// <summary>
/// Returns an array of RadioButton Controls
/// </summary>
public RadioButton[] ArrAnswers
{
    get
    {
        return rdb_answers;
    }
}
{% endhighlight %}



## Anwendung der Klasse im Fragebogen


Die Anpassung der Form ist recht einfach. Wir fügen der Methode Form1_Load() folgende Zeile hinzu:

{% highlight csharp %}
this.Controls.AddRange(a.ArrAnswers);
{% endhighlight %}

<!--[![button_next](http://wpimages.phansch.de/2010/06/button_next.png)](http://wpimages.phansch.de/2010/06/button_next.png)-->

Weiterhin soll man den Weiter-Button nicht benutzen können, bevor eine Antwort ausgewählt ist. Dazu wird die Eigenschaft _enabled_ des Buttons _button_next_ zunächst auf _false_ gesetzt.

Wenn nun eine Antwort ausgewählt wird, soll der Button aktiviert werden. Dazu müssen wir jedem unserer _RadioButtons_ einen _EventHandler_ zuweisen.

Der EventHandler aktiviert den Button _button_next_ wieder. Außerdem werden wir im letzten Teil dieser Reihe an dieser Stelle die Antworten sammeln.

In der Methode Form1_Load fügen wir jedem RadioButton einen Click-Eventhandler hinzu:

{% highlight csharp %}
//Add an eventhandler for each radiobutton
foreach (RadioButton rdb in a.ArrAnswers)
{
    rdb.Click += Handler;
}
{% endhighlight %}

Die Methode Handler aktiviert den Weiter-Button wieder wenn ein Click-Event von einem der RadioButtons ausgeht.
    
{% highlight csharp %}
/// <summary>
/// Eventhandler for the Radiobuttons.
/// </summary>
/// <param name="sender"></param>
/// <param name="e"></param>
private void Handler(object sender, EventArgs e)
{
    button_next.Enabled = true;
}
{% endhighlight %}

Nun muss noch die Methode button_next_Click() erweitert werden. Dort wird die vorherige Antwort und der Weiter-Button wieder deaktiviert:

{% highlight csharp %}
private void button_next_Click(object sender, EventArgs e)
{
    UpdateQuestion();

    //deselect the last answer
    foreach (RadioButton rdb in a.ArrAnswers)
    {
        if (rdb.Checked == true)
        {
            rdb.Checked = false;
            break;
        }
    }

    button_next.Enabled = false;
}
{% endhighlight %}
Um zu verhinden, dass nach der letzten Frage die Antworten angezeigt werden, müssen wir die Methoden _EndReached()_ und _Restart()_ erweitern:
    
{% highlight csharp %}
private void EndReached()
{
    //.
    //. //Skipped some lines here
    //.

    //Set all Answers invisible
    foreach (RadioButton rdb in a.ArrAnswers)
    {
        rdb.Visible = false;
    }
}

private void Restart()
{
    //.
    //. //Skipped some lines here
    //.

    //Set all Answers visible
    foreach (RadioButton rdb in a.ArrAnswers)
    {
        rdb.Visible = true;
    }
}
{% endhighlight %}


Das war's auch schon. Wir können nun beliebige Fragen und Antworten ausgeben lassen und den Test wiederholen. Damit haben wir schon über die Hälfte unserer Anforderungen an das Programm erfüllt. Nun fehlt nur noch eine grafische Darstellung der Testergebnisse.

Die bisherige Lösung als .zip Datei: <!--[CSharpQuiz_4](http://wpimages.phansch.de/2010/06/CSharpQuiz_4.zip)--> Nicht mehr verfügbar.
