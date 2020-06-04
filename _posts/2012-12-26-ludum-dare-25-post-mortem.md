---
layout: post
location: Rheda-Wiedenbrück
title: Ludum Dare 25 Post Mortem
excerpt: "A recap of my first Ludum Dare game jam."
aliases: ["2012/12/26/ludum-dare-25-post-mortem/"]
---

This was my first time participating in a game jam. The jam was a blast, although I didn't like the theme: You are the villain. I spent the first hour brainstorming ideas for the theme and ended with a space shooter where you shoot at defenseless transport ships.


[The source](https://gitlab.com/phansch/ludumdare25/tree/master), [the timelapse](http://www.youtube.com/watch?v=eX7fsD3Hbmc). I didn't publish a playable version, yet. You can get it from github and swap out the music that's missing, to make it run.

<a href="/assets/images/posts/2012-12-26-ludum-dare-25-post-mortem/ld25screenshot1.png"><img class="th screenshot" src="/assets/images/posts/2012-12-26-ludum-dare-25-post-mortem/ld25screenshot1.png" width="310" alt="screenshot" /></a><a href="/assets/images/posts/2012-12-26-ludum-dare-25-post-mortem/ld25screenshot2.png"><img class="th screenshot" src="/assets/images/posts/2012-12-26-ludum-dare-25-post-mortem/ld25screenshot2.png" width="310" alt="screenshot" /></a>

## What was good
 * This is my first game that I pretty much finished. On a single weekend! I did pacman, breakout and pong clones in C# and Lua before, but I never really created a game on my own in such a short amount of time. 
 * I learned a ton! (See below)


## What went wrong

#### Too many firsts

 * Only played around with Lua and Love2D for a week
 * Never did a screenlapse before
 * When the jam started, I had no idea how to create a good game soundtrack or where to get them
 * I also added a new library for managing game states on Saturday. I had to move a lot of code around.
 * Particle Systems in Love2D. 

#### At the end I lost my motivation to finish it
Therefore, the last sequence isn't implemented and the game doesn't really end. I am not sure how to stay motivated until the end, next time. 

#### I focused too much on the story instead of making the game work
I want to blame this on the topic for this Ludum Dare. I had a story in mind where the player controls an alien spaceship, shooting at humans.
It turned out, that it was difficult to distinguish between aliens and humans. Therefore, I put in a lot of text that explains who you (the player) are.

Maybe there are better way to do this, but a space shooter where you are the villain was probably a bad idea in the first place.

#### The overall gameplay and mechanics are lacking
Admittedly, I am not a game designer - rather a programmer. But I should put some more effort into this area next time.

