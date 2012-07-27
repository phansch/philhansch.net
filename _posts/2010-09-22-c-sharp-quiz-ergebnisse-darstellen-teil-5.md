---
comments: true
date: 2010-09-22 16:52:22
layout: post
slug: c-sharp-quiz-ergebnisse-darstellen-teil-5
title: C# Quiz – Ergebnisse darstellen (Teil 5)
wordpress_id: 314
categories:
- C#
- Programming
tags:
- .net
- c sharp
- c#
- ergebnisse darstellen
- fragebogen
- quiz
---

Im [vorherigen Tutorialteil](http://blog.phansch.de/2010/09/c-sharp-quiz-antworten-darstellen-teil-4/) haben wir die Grundlagen für das Auswerten der Fragen programmiert.

Ein kurzer Blick auf unsere [ToDo Liste](http://blog.phansch.de/2010/07/c-sharp-quiz-planung-teil-1/) sagt uns, dass wir nur noch eine **grafische Liveauswertung der Ergebnisse** implementieren müssen.

Meine Wahl für ein passende Auswertung habe ich mit [ZedGraph](http://blog.phansch.de/2010/09/c-sharp-diagramme-und-graphen-mit-zedgraph/) bereits getroffen. ZedGraph ist einfach zu benutzen und sehr flexibel was die Darstellungsformen angeht.

Wir stehen jetzt vor **2 Teilproblemen**:



	
  1. Sammeln der Ergebnisse

	
  2. Erstellung des Diagramms





## Sammeln der Ergebnisse


Das sammeln der Ergebnisse ist überraschend einfach.

Wir legen eine neue Membervariable an:

    
    
    private double[] answerCount; //Contains the choices
    


Diese wird dann in der Methode Form1_Load initialisiert:


    
    
    //Initialize the array (size = total possible answers)
    answerCount = new double[a.Count];
    



Der Gedanke ist recht simpel:
Das Array hat eine Größe die der Anzahl der Antworten entspricht. In unserem Fall wäre das 4.
Wenn nun eine Antwort bestätigt wird (_button_next_Click_) können wir den Wert des entsprechenden Arrayfeldes erhöhen.

Wir erweitern nun die IF Abfrage in der Methode button_next_Click():

    
    
                    if (rdb.Checked == true)
                    {
                        //Save the answer
                        int answerID;
                        answerID = Convert.ToInt32(rdb.Name);
                        answerCount[answerID] += 1;
    
                        //Set the answer to unchecked and break
                        rdb.Checked = false;
                        break;
                    }
    


So können wir für jede Antwortmöglichkeit bequem die Anzahl der Antworten feststellen.



## Erstellung des Diagramms


Für den letzten Schritt müssen wir ein paar Vorbereitungen treffen.
Um ZedGraph benutzen zu können, brauchen wir einen Verweis auf die ZedGraph.dll und das entsprechende Steuerelement in der Toolbox.
Wie das geht kann in [diesem Blogeintrag](http://blog.phansch.de/2010/09/c-sharp-diagramme-und-graphen-mit-zedgraph/) nachgelesen werden.

Als nächstes verbreitern wir unsere Form und fügen das ZedGraphControl hinzu.
In etwa so:
[caption id="attachment_696" align="aligncenter" width="300" caption="QuizForm mit ZedGraphControl"][![QuizForm mit ZedGraphControl](http://wpimages.phansch.de/2010/06/quiz_teil5_1-300x126.png)](http://wpimages.phansch.de/2010/06/quiz_teil5_1.png)[/caption]



### Initialisierung des Diagramms


Soweit zur Vorbereitung des Diagramms. Nun fehlen uns noch 2 Methoden und entsprechend die Aufrufe.
Der erste Schritt ist die Initialisierung des Diagramms. Hier werden sämtliche Startattribute festgelegt.

    
    
            private void InitChart(ZedGraphControl zgc)
            {
                GraphPane myPane = zgc.GraphPane;
    
                //Set a title
                myPane.Title.Text = "Auswertung";
                myPane.Title.FontSpec.Size = 30;
    
                //titles and axislabels
                myPane.XAxis.Title.Text = "Antwortmöglichkeiten";
                myPane.XAxis.Title.FontSpec.Size = 25;
                myPane.YAxis.Title.Text = "Anzahl";
                myPane.YAxis.Title.FontSpec.Size = 25;
    
                //Set labels for the x-axis
                string[] XLabels = a.arr_data;
                myPane.XAxis.Type = AxisType.Text;
                myPane.XAxis.Scale.TextLabels = XLabels;
                myPane.XAxis.Scale.FontSpec.Size = 15;
    
                //Set labels for the y-axis
                myPane.YAxis.Scale.FontSpec.Size = 20;
                myPane.YAxis.Scale.FontSpec.IsBold = true;
    
                //Refresh the graph
                zgc.AxisChange();
            }
    


Diese Methode wird nur einmal aufgerufen:

    
    
            private void Form1_Load(object sender, EventArgs e)
            {
                ..
                ..
                ..
                //Initialize the chart
                InitChart(zedGraphControl1);
            }
    


Wenn wir das Programm so ausführen erhalten wir folgendes Bild:
[caption id="attachment_705" align="aligncenter" width="300" caption="Initialisiertes Diagramm ohne Balken"][![Initialisiertes Diagramm ohne Balken](http://wpimages.phansch.de/2010/06/quiz_teil5_2-300x124.png)](http://wpimages.phansch.de/2010/06/quiz_teil5_2.png)[/caption]


### Update des Diagramms


Nun fehlen nur noch die Balken, welche die Anzahl der Antworten repräsentieren.

    
    
    private void UpdateChart(ZedGraphControl zgc)
    {
        GraphPane myPane = zgc.GraphPane;
    
        //Needed for redrawing the chart, to remove old curves
        myPane.CurveList.Clear();
    
        //Add the actual bars
        BarItem myBar = myPane.AddBar("Antworten", null, answerCount,
                                        Color.Red);
    
        //Refresh the graph in order to show the new data
        zgc.AxisChange();
        zgc.Refresh();
    }
    


Aufgerufen wir UpdateChart() im button_next_Click-Eventhandler:

    
    
    private void button_next_Click(object sender, EventArgs e)
    {
        ..
        ..
        foreach (RadioButton rdb in a.ArrAnswers)
        {
            if (rdb.Checked == true)
            {
                ..
                ..
                UpdateChart(zedGraphControl1);
                //Set the answer to unchecked and break
                rdb.Checked = false;
                break;
            }
        }
        ..
        ..
    }
    



Das war es auch schon. Die fertige Solution gibt es auch als Download: [CSharpQuiz_5.zip](http://wpimages.phansch.de/2010/06/CSharpQuiz_5.zip)

Ich hoffe, dass meine erste Blogreihe eine gute Hilfestellung, auch für C# Anfänger, bietet.
Anregungen und Wünsche können gerne in den Kommentaren geäußert werden. :)
