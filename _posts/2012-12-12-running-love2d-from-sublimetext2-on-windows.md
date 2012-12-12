---
layout: post
location: Berlin
title: Running Love2D from Sublime Text 2 on Windows
---
It's fairly easy to execute your Love2D game from within Sublime Text 2. Here's how.

First, make sure that love is in your path variable.

  1. Open System Properties
  2. Go to advanced tab
  3. Open environment variables
  4. Select path under system variables
  5. Append `;<your\path\to\love>` (e.g: C:\Program Files (x86)\LOVE)
  6. Restart your machine

Then all what's left is adding a new build system for LOVE.

  1. In Sublime Text 2, go to Tools -> Build System -> New Build System...
  2. Change `"cmd": ["make"]` to `"cmd": ["love", "$file_path"]`
  3. Save the file as `RunLove.sublime-build` and select `RunLove` from Tools -> Build System

To see if this is working, go to your main.lua and hit CTRL + B.  
You can also use the built-in console to see the output of you game.

<a href="http://i.imgur.com/nSKvX.jpg"><img class="screenshot" src="http://i.imgur.com/nSKvXh.jpg" width="820" /></a>