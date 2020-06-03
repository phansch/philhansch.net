---
layout: post
title: "Productivity sideprojects"
aliases: [""]
---

So I have been keeping track of the stuff I do for a while now. 
I'm using a simple markdown formatted file to write things down. It's part of my GTD process and feels nice to look over when feeling less productive.
My editor of choice is Sublime Text 3.

After using this setup for a few months, I felt it wasn't efficient enough.
Opening the journal file in markdown required tedious navigation through many directories.  

So I started writing a simple ruby script.

## Introducing *jou*
Jou is a simple command line utility that helps with maintaining a journal file in markdown syntax.

* Install it with `gem install jou`
* Set a path to your journal file: `jou --set-journal "/home/user/Documents/Journal.md"`
* Add entries by using `jou -a "Gave jou a try"`

The source is available on [GitHub](https://github.com/phansch/jou).

(This may or may not work on a Mac.)

## Introducing *routines*

Routines is my way of building and keeping habits. It's the morning part of my GTD process.
The script is launched when I power on my PC. It then continues by reminding me of my morning routine.
It launches my calendar, email, my tasklist and anki. Here's a screenshot:

<a href="https://github.com/phansch/dotfiles/raw/master/screenshots/routines.png" class="thumbnail">
  <img src="https://github.com/phansch/dotfiles/raw/master/screenshots/routines.png" alt="screenshot">
</a>

The script is part of my [dotfiles](https://github.com/phansch/dotfiles/tree/master) repository and can be found [here](https://github.com/phansch/dotfiles/blob/522c6e73566178c8dd73d343f9cda7157665c778/bin/routines).

Have a beautiful day!
