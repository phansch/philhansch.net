---
comments: true
date: 2010-09-19 16:14:28
layout: post
slug: c-sharp-diagramme-und-graphen-mit-zedgraph
title: C# - Diagramme und Graphen mit ZedGraph
wordpress_id: 611
---

**Note**: Die ZedGraph Website existiert leider nicht mehr, deshalb habe ich die links entfernt.
Für die Darstellung von Graphen und Diagrammen in einer Form gibt es verschiedene Werkzeuge. Der Großteil der Angebote ist allerdings nicht kostenlos oder nur gering konfigurierbar. Auf der Suche nach weiteren Bibliotheken bin ich auf **ZedGraph** gestoßen.

ZedGraph ist eine freie Bibliothek zum Erstellen von flexiblen Diagrammen und Graphen. Mit ZedGraph lassen sich alle Formen von 2D Diagrammen darstellen. Die Diagramme bieten Optionen zum Zoomen, drucken, kopieren und speichern.

Während die ZedGraph Wiki bereits viele Beispiele bietet, werde ich ebenfalls die Grundfunktionen von ZedGraph anhand eines kleinen Beispiels erläutern.


## Darstellung von zufälligen Zahlen als Streudiagramm


Um ZedGraph benutzen zu können, muss die aktuelle Bibliothek [hier](http://sourceforge.net/projects/zedgraph/files/) heruntergeladen und entpackt werden.
Wir erstellen zunächst ein neues Windows Forms Projekt. Als erstes fügen wir einen Verweis zur _ZedGraph.dll_ hinzu. Dazu kopieren wir zunächst die ZedGraph.dll in das _bin/Debug_ Verzeichnis unseres Projektes.

<!--[![ZedGraph.dll im bin/Debug Verzeichnis](http://wpimages.phansch.de/2010/09/zedgraph_1.png)](http://wpimages.phansch.de/2010/09/zedgraph_1.png)-->

Anschließend fügen wir im Projekt-Explorer einen Verweis zur ZedGraph.dll hinzu ([how-to](http://msdn.microsoft.com/de-de/library/wkze6zky.aspx)).

Mit

    
    using ZedGraph;


können wir jetzt auf sämtliche Funktionen von ZedGraph zurückgreifen. Um das _ZedGraphControl_ nutzen können, müssen wir das Element noch der [Toolbox hinzufügen](http://msdn.microsoft.com/en-us/library/ms165355%28VS.80%29.aspx). An dieser Stelle werde wir das Formdesign nicht näher betrachten. Wir gehen direkt in den Code.

Zunächst haben wir zwei Klassen auf die wir zurückgreifen:

    
            Random rNum = new Random();
            PointPairList randomData = new PointPairList();


[Random](http://msdn.microsoft.com/en-us/library/system.random.aspx) ist Teil des .net Frameworks und gibt uns eine zufällige Zahl zurück.
[PointPairList](http://zedgraph.sourceforge.net/documentation/html/T_ZedGraph_PointPairList.htm) ist eine Klasse der ZedGraph Bibliothek und ist eine Liste von PointPair Objekten.

Nun die Methode zum Erzeugen von 200 zufälligen Zahlen:


    private void button_update_Click(object sender, EventArgs e)
    {
        randomData.Clear(); //Remove old data

        int i = 0;
    
        do
        {
            i++;
    
            //Add random new data to the PointPairList
            randomData.Add(rNum.Next(1, 255), rNum.Next(1, 255));
        }
        while (i < 199);
    
        //Update the chart
        CreateChart(zedGraphControl1);
    }


Und die Methode CreateChart:

    
    private void CreateChart(ZedGraphControl zgc)
    {
        GraphPane myPane = zgc.GraphPane;
    
        //Needed for redrawing the chart, to remove old curves
        myPane.CurveList.Clear();
    
        //Add the data
        LineItem myCurve = myPane.AddCurve("Random Values", randomData,
                                            Color.Black);
    
        //Customize the graph
        myCurve.Line.IsVisible = false; //Hide line-connections
        myCurve.Symbol.Type = SymbolType.Circle;
        myCurve.Symbol.Size = 2f;
        myCurve.Symbol.Fill.Type = FillType.Solid;
        myCurve.Symbol.IsAntiAlias = true; //Makes the circles smoother
    
        //Refresh the graph in order to show the new data
        zgc.AxisChange();
        zgc.Refresh();
    }


Zunächst erstellen wir einen Verweis auf das ZedGraphControl. Mit _myPane_ könnten wir auf die zahlreichen Properties zugreifen.
Wir nutzen es in diesem Beispiel aber nur um alte Daten im Falle einen Updates zu entfernen.

    
    LineItem myCurve = myPane.AddCurve("Random Values", randomData,
                                        Color.Black);



Hier erzeugen wir das Objekt _myCurve_. Es wird mit einem LineItem Objekt gefüllt, welches die Daten enthält die wir zuvor erzeugt haben.

Anschließend werden noch einige Anpassungen an der Darstellung vorgenommen:

    
    myCurve.Symbol.Type = SymbolType.Circle;
    myCurve.Symbol.Size = 2f;
    myCurve.Symbol.Fill.Type = FillType.Solid;



Diese Einstellungen sorgen dafür, dass die Datensymbole 2 Punkte große, gefüllte Kreise sind.

Zuletzt wird das ZedGraphControl aktualisiert um die neuen Daten anzuzeigen.

Beispiel als Download: <!--[ZedGraphExample](http://wpimages.phansch.de/2010/09/ZedGraphExample.zip). (Benötigt wird [Visual C# 2010 Express](http://www.microsoft.com/express/Downloads/#2010-Visual-CS))--> Beispiel entfernt.

Weiterführende Links:
[http://www.codeproject.com/KB/graphics/zedgraph.aspx](http://www.codeproject.com/KB/graphics/zedgraph.aspx)
