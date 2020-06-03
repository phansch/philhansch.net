---
layout: post
location: Berlin
title: PiDefender Week 2
excerpt: "Just a few graphical updates. Also no download this week."
---

I had more important stuff to work on, this week. It's the usual madness at the end of every semester. Projects piling up and exams are coming closer each day. So I have to commit a lot of time to that. Luckily, I'm done with almost all of the projects, so I can focus on learning and finishing PiDefender. 

Due to that I cut down on a lot of stuff I was going to do with PiDefender. Here's a list of what initially was going to be in, but now isn't making it:
 
 * Possible boss mechanics
 * Main screen fanciness (random ship movement in the background)
 * Circle diameter is based on window size.
 * Loot drops
 * Player *docks* on cannon, instead of passing through the planet.


Did I mention that I switched to Linux Mint + [dwm](http://dwm.suckless.org/)? This made me realize that the game crashes on Linux. So far, I didn't really investigate the crash, but I honestly have no clue why that happens. It's running fine on Windows and LÖVE claims to work on Windows, Mac OS X and Linux. 

That's also the reason why there is no download this week. However, if you feel adventurous, you can still [download the source](https://gitlab.com/phansch/pidefender/repository/archive.zip?ref=master), .zip it, rename it to .love and run it. (Make sure that main.lua is at the root of the .zip file)

## What's left to do ##

Increasing difficulty. I want this game to be more challenging!

 * If the player is hit by his own fire, he looses a life.

I want to add one more enemy type, sort of like a [strategic bomber](http://en.wikipedia.org/wiki/Strategic_bomber):
 
 * Stays at distance, but moving.
 * Deals more damage/second than the suicidal enemies.
 * Can take multiple hits 

I also want to add an AOE weapon for the player:

 * Works in the same way as the *projectile*.
 * Kills everything within a specific radius, including the player

See you next week!
