+++
title = "Hackership Week 3"
template = "post.html"
tags = ["hackership"]
aliases = ["2013/12/02/hackership-week3/"]

[extra]
excerpt = "November is almost over. And so is the third week of Hackership. Check out what I worked on this week."
+++

This week was a little bit less about rails and more about front-end stuff. I needed to get some Ajax to work. And that proved to be very difficult. Especially considering that I didn't know in what form rails is expecting PATCH data.

On **Monday** I continued working on the sign-in and sign-out system for the touch-typing website. Once I was done with that, I had to update the user model to include a new column which stores the WPM of users. The [Rails guide for migrations](http://guides.rubyonrails.org/migrations.html) was pretty useful to get that done. In the evening it was time to get to know our Hackers in residence.


**Tuesday** started off with a very insightful blogging workshop from [@laurawadden](https://twitter.com/laurawadden) and [@sheley](https://twitter.com/sheley).
After the blogging workshop, it was time for the Rails Q&A led by [@freenerd](https://twitter.com/freenerd). We talked about [validations](http://edgeguides.rubyonrails.org/active_record_validations.html) and [associations](http://guides.rubyonrails.org/association_basics.html). After Hackership it was time for [Berlin Hack and Tell](http://www.meetup.com/Berlin-Hack-and-Tell/events/151270052/).

On **Wednesday** one thing I was trying to figure out was: <q>What exactly Rails is expecting from an Ajax request?</q> I spent a lot of time in the development.log and tried to solve various errors. Eventually I got it working with the help of Ben. Once I got it working I was able to make a lot of progress. The WPM of a user is now automatically submitted once the lesson is finished.


**Thursday** started in the evening for me. I mainly did some CoffeeScript refactoring. Here are some interesting resources I found helpful:


#### [js2coffee.org](http://js2coffee.org)

This is a CoffeeScript to JavaScript converter. I used it to covert my original JavaScript to CoffeeScript.

#### [Smooth CoffeeScript - Interactive Edition](http://autotelicum.github.io/Smooth-CoffeeScript/interactive/interactive-coffeescript.html)

Smooth CoffeeScript is an interactive book on CoffeeScript. I found the [chapter on Functional Programming](http://autotelicum.github.io/Smooth-CoffeeScript/interactive/interactive-coffeescript.html#functional-programming) really interesting.

#### [The Little Book on CoffeeScript](http://arcturo.github.io/library/coffeescript/)

This book contains a very helpful section on the syntax of CoffeeScript and also a short introduction to Classes.


**Friday** is not an official Hackership day, but there was a lot of interest in an Arduino Workshop. So, we started at 12. Since there was an Arduino Workshop the previous Friday which I didn't attend, I had to setup my environment first which went surprisingly smooth. Making the LED's blink was just a matter of about half an hour. I didn't stop at making one LED blink. There was a very difficult practice which required a lot of conncetors and resistors. Making sure that everything is connected correctly was not an easy task. The task was to create an LED array to display a certain image. The image was set in a 2D array in the source file. This was a really fun exercise and eventually I got it to work, yay!

---

That's it for the third week of Hackership. Next week I'm going to work on the database model and some CoffeeScript refactoring.
