---
comments: true
date: 2010-12-11 16:10:44
layout: post
slug: getting-started-with-cplusplus
title: Getting started with C++
wordpress_id: 871
---

This post is a rough translation from german to english and is based on this post: [Mein Einstieg in C++](http://blog.phansch.de/2010/09/mein-einstieg-in-cplusplus/).





In order to get started with [C++](http://blog.phansch.de/category/programming/cpp/) i decided to have a look at problem #2 on [projecteuler.net](http://projecteuler.net/).   
A description of the problem can be found [here](http://projecteuler.net/index.php?section=problems&id=2).



Basically, you have to find the sum of all even-valued terms in the fibonacci sequence which do not exceed four million. Sounds easy, doesn't it?

**Here's how i solved it.**

In order to get a specific fibonacci number I used a formula made by Moivre-Binet.

<!--![Moivre-Binet's formula to get the n'th fibonacci number](http://upload.wikimedia.org/math/1/6/e/16ea0dee516003a472c75c4e0b8b4154.png)-->

What is amazing about this formula, is that it uses three square roots and still returns integer numbers.
Don't believe me? I couldn't really believe it either so i simply implemented it in C++:

    
    double getNthFibonacci(double n)
    {
    	double out;
    	out = 1/sqrt(5.0) * (pow(((1+sqrt(5.0))/2), n)
    		- pow(((1-sqrt(5.0))/2), n));
    	return out;
    }
    


The rest is relativley simple. Just check if the returned number is _even-valued_ and _less than four million_.
If that's the case, add the number to the _sum_ variable.

    
    int _tmain(int argc, _TCHAR* argv[])
    {
    	double Fib = 0;
    	double sum = 0;
    	int i = 1;
    
    	while(true)
    	{
    		Fib = getNthFibonacci(i);
    		if(Fib < = 4000000)
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
    
    	cout << "Sum: " << sum;
    	cin.get();
    
    	return 0;
    }
    


While the formula of Moivre-Binet might not be very efficient it's quite interesting that it returns integer numbers.
