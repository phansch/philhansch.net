---
comments: true
date: 2010-09-04 17:17:07
layout: post
slug: mein-einstieg-in-cplusplus
title: Mein Einstieg in C++
wordpress_id: 584
categories:
- C / C++
- Programming
tags:
- c#
- euler
- fibonacci
- moivre-binet
---

![cplusplus](http://phansch.de/blog/wp-content/gallery/allgemein/cplusplus.png)Für meinen Einstieg in C++ habe ich mir das Problem #2 von [projecteuler.net](http://projecteuler.net) herausgesucht. Die Problembeschreibung befindet sich [hier](http://projecteuler.net/index.php?section=problems&id=2).

Für die Lösung muss man zunächst die Fibonacci Zahlen bestimmen. Dafür verwende ich die Formel von Moivre-Binet:

![Formel von Moivre-Binet zur bestimmung von Fibonacci Zahlen](http://upload.wikimedia.org/math/1/6/e/16ea0dee516003a472c75c4e0b8b4154.png)

In C++ sieht das dann so aus:

    
    double getNthFibonacci(double n)
    {
    	double out;
    	out = 1/sqrt(5.0) * (pow(((1+sqrt(5.0))/2), n)
    		- pow(((1-sqrt(5.0))/2), n));
    	return out;
    }
    


Der Rest ist relativ simpel. Es wird geprüft, ob die Zahl kleiner als 4.000.000 ist und ob sie eine gerade Zahl ist.
Wenn das der Fall ist, wird der Variable _sum_ die Zahl hinzuaddiert.

    
    int _tmain(int argc, _TCHAR* argv[])
    {
    	double Fib = 0;
    	double sum = 0;
    	int i = 1;
    
    	while(true)
    	{
    		Fib = getNthFibonacci(i);
    		if(Fib <= 4000000)
    		{
    			if((int)Fib % 2 == 0)
    			{
    				sum += Fib;
    			}
    			i++;
    		}
    		else
    			break;
    	}
    
    	cout << "Summe: " << sum;
    	cin.get();
    
    	return 0;
    }
    


Das ist weder die schnellste, noch die eleganteste Lösung aber ich konnte mir zunächst nicht vorstellen, dass die Formel wirklich immer ganze Zahlen ausspuckt.

**Quellen:**
[http://de.wikipedia.org/wiki/Fibonacci-Folge](http://de.wikipedia.org/wiki/Fibonacci-Folge)
[http://msdn.microsoft.com/de-de/library/bb978923.aspx](http://msdn.microsoft.com/de-de/library/bb978923.aspx)
