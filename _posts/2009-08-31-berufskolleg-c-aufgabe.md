---
comments: true
date: 2009-08-31 14:45:43
layout: post
slug: berufskolleg-c-aufgabe
title: Berufskolleg - C# Aufgabe
wordpress_id: 111
aliases: ["2009/08/31/berufskolleg-c-aufgabe/"]
---

Aufgabe:
1) Erstelle eine Klasse _Rechteck_ mit der Werte wie _Fläche_, _Umfang_ und _Diagonale_ berechnet werden können.


    
    
    class Rechteck
    {
        double länge;
        double breite;
    
        static void Main(string[] args)
        {
            double out_fläche, out_umfang, out_diagonale;
    
    
            Rechteck rechne = new Rechteck();
            rechne.länge = 10;
            rechne.breite = 10;
            out_fläche = rechne.Fläche(rechne.länge, rechne.breite);
            out_umfang = rechne.Umfang(rechne.länge, rechne.breite);
            out_diagonale = rechne.Diagonale(rechne.länge, rechne.breite);
    
            Console.WriteLine("Fläche: " + out_fläche);
            Console.WriteLine("Umfang: " + out_umfang);
            Console.WriteLine("Diagonale: " + out_diagonale);
            Console.ReadLine();
        }
    
        private double Fläche(double länge, double breite)
        {
            double fläche;
            fläche = länge * breite;
            return fläche;
        }
    
        private double Umfang(double länge, double breite)
        {
            double umfang;
            umfang = (2 * (länge + breite));
            return umfang;
        }
    
        private double Diagonale(double länge, double breite)
        {
            double diagonale;
            diagonale = Math.Sqrt(Math.Pow(länge, 2) + Math.Pow(breite, 2));
            return diagonale;
        }
    }
