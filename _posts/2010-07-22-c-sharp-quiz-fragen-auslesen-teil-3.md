---
comments: true
date: 2010-07-22 20:00:09
layout: post
slug: c-sharp-quiz-fragen-auslesen-teil-3
title: C# Quiz - Fragen auslesen (Teil 3)
wordpress_id: 309
---

Im [vorherigen Tutorialteil](http://phansch.net/2010/07/22/c-sharp-quiz-vorbereitung-teil-2) haben wir das Fragebogenformular gebaut. Nun wollen wir die Fragen auslesen lassen.

Bevor wir die Fragen auslesen und darstellen können, müssen wir uns die Frage stellen, ob wir bei einem einfachen Textformat bleiben wollen. So hat das .xml Format den Vorteil, dass es sich leichter in andere Formate umwandeln lässt. Eine Datenbank hätte den Vorteil, dass man Fragen und Antworten an einem zentralen Ort speichern kann.
Dass das .xml Format und eine Datenbank einige Vorteile gegenüber einer einfachen Textdatei haben, liegt klar auf der Hand. Doch für welches Format sollte man sich entscheiden?

Mit dem .net Framework 3.5 gibt es eine neue Möglichkeit zur Abfrage von Datenquellen wie XML-Dateien oder Datenbanken: *LINQ*. Mit LINQ ist es möglich .xml Datenquellen und SQL Server Datenbankobjekte auszulesen und zu bearbeiten. Da ein SQL Server deutlich mehr Konfiguration und Wartung bedarf als eine einfache .xml Datei, werden wir für dieses Projekt .xml Dateien verwenden.

Zunächst müssen die Fragen also in eine XML Struktur umgewandelt werden.
(Der Download zur Fragen.xml wurde entfernt, da die Datei nicht mehr existiert)


## Die Klasse _Questions_


Nun brauchen wir eine Klasse, die die Fragen ausließt.

Diese Klasse hat zunächst folgendes Grundgerüst:

{% highlight csharp  %}
using System;
using System.Xml.Linq;
using System.Linq;

namespace CSharpQuiz
{
    class QuizXml
    {
        public string Path { get; set; }
        public XName xmlElement { get; set; }
        public XName xmlSub { get; set; }
        public string[] arr_data { get; set; }

        /// <summary>
        /// Returns the number of questions wich are stored in the .xml file
        /// </summary>
        public int Count { get; }

        /// <summary>
        /// Fills the array with the questions, found in the.xml file
        /// </summary>
        public virtual void PopulateArray() {}

        /// <summary>
        /// Expands the array by one
        /// </summary>
        private void ExpandArray() {}
    }
    class Questions : QuizXml
    {
        public Questions() { }

        /// <summary>
        /// Contains the questions in string format
        /// </summary>
        private string[] arr_questions;

        /// <summary>
        /// Returns a question
        /// </summary>
        /// <param name="index">Index of the question to be returned</param>
        /// <returns>string question</returns>
        public string this[int index] { get; }
    }
}
{% endhighlight %}

Der Konstruktor der abgeleiteten Klasse _Questions_ legt sämtliche Properties fest und ruft die Methode _PopulateArray()_ auf. Außerdem wird das Array initialisiert:

    
{% highlight csharp  %}
public Questions()
{
    base.arr_data = new string[1];
    base.Path = "Fragen.xml";
    base.xmlElement = "fragen";
    base.xmlSub = "frage";

    base.PopulateArray();

    this.arr_questions = base.arr_data;
}
{% endhighlight %}


Die Methode _PopulateArray()_ liest die Fragen mittels *LINQ to XML* aus:

    
{% highlight csharp  %}
/// <summary>
/// Fills the array with the questions, found in the.xml file
/// </summary>
public virtual void PopulateArray()
{
    XDocument xdoc = XDocument.Load(this.Path);

    var query = from xml in xdoc.Elements(this.xmlElement).Elements(this.xmlSub)
                select xml;

    foreach (XElement el in query)
    {
        ExpandArray();
        int _id = Convert.ToInt32(el.FirstAttribute.Value);
        string _question = el.Value;

        //Add the question the array
        this.arr_data[_id] = _id + ". " + _question;
    }
}
{% endhighlight %}


Damit das Array nicht überläuft, wird die Methode _ExpandArray()_ aufgerufen. Die sorgt dafür, dass das Array um ein Element vergrößert wird.

    
{% highlight csharp  %}
/// <summary>
/// Expands the array by one
/// </summary>
private void ExpandArray()
{
    //Creates a temporary array wich is +1 bigger than the original questions array
    string[] tempArray = new string[this.arr_data.Length + 1];

    //Original array gets copied to the temporary array
    this.arr_data.CopyTo(tempArray, 0);

    //Temporary array gets assigned to the original array
    this.arr_data = tempArray;
}
{% endhighlight %}

Die Eigenschaft _Count_ gibt nur die Größe des Arrays zurück:

    
{% highlight csharp  %}
/// <summary>
/// Returns the number of questions wich are stored in the .xml file
/// </summary>
public int Count
{
    get
    {
        return arr_questions.Length;
    }
}
{% endhighlight %}

Zuletzt brauchen wir noch den Indexer:

    
{% highlight csharp  %}
/// <summary>
/// Returns a question
/// </summary>
/// <param name="index">Index of the question to be returned</param>
/// <returns>string question</returns>
public string this[int index]
{
    get
    {
        return arr_questions[index];
    }
}
{% endhighlight %}

## Anwendung der Klasse im Fragebogen


Aufgrund des Indexers können wir die Frage 1 mittels

    
{% highlight csharp  %}
Questions q = new Questions();
label_frage.Text = q[1];
{% endhighlight %}

aufrufen. Der übergebene Wert steht für eine ID aus der Fragen.xml Datei. Deshalb müssen wir nicht bei 0 anfangen, sondern können die erste Frage auch mit _f[1]_ ausgeben lassen. Wir benötigen auch einen _FragenIndex_, der zu Anfang auf 1 gesetzt wird.

Die Methode ShowQuestion() lässt eine bestimmte Frage ausgeben und erhöht danach den FragenIndex. Wenn das Ende erreicht ist, wird die Methode _EndReached()_ aufgerufen.

    
{% highlight csharp  %}
private void ShowQuestion()
{
    Questions questions = new Questions();
    if (questions.Count > questionIndex)
    {
        //Display the question
        label_question.Text = questions[questionIndex];

        //Increase the index
        questionIndex++;
    }
    else
    {
        EndReached();
    }
}

private void EndReached()
{
    button_next.Enabled = false;
    label_question.Text = "Ende des Fragebogens erreicht.";
    button_restart.Visible = true;
}
{% endhighlight %}


Wann soll nun eine neue Frage geladen werden?



	
  * Beim Start des Programms
  * Beim Klick auf den _Weiter-Button_

Dazu brauchen wir die zwei EventHandler _Form1_Load_ und _button_weiter_Click_. Diese beiden EventHandler werden die Methode _ShowQuestion()_ aufrufen.


Wer den ersten Teil gelesen hat, wird sich an unsere definierten Anforderungen erinnern. **Wir wollen den Test wiederholbar gestalten.**
Dazu müssen wir einen neuen Button in der Form hinzufügen:
<!--[![Fragebogen](http://wpimages.phansch.de/2010/06/quiz_form-150x150.jpg)](http://wpimages.phansch.de/2010/06/quiz_form.jpg)-->

Den Wiederholen Button setzen wir zunächst über die IDE auf _Visible = false_.

Jetzt brauchen wir nur noch die Methode _Restart()_:

    
{% highlight csharp  %}
private void Restart()
{
    questionIndex = 1;
    button_next.Enabled = false;
    button_restart.Visible = false;
    ShowQuestion();
}
{% endhighlight %}


_Restart()_ wird über das Click-Event des Restart-Buttons aufgerufen.

Wir haben nun eine dynamische Lösung zum Auslesen von .xml Dateien die entsprechend formatiert sind. Die Fragen können auch beliebig geändert werden. Im nächsten Teil dieser Reihe werden wir schauen, wie wir die Antworten bereitstellen können.

Die bisherige Lösung als zip-Datei: Nicht mehr verfügbar.
