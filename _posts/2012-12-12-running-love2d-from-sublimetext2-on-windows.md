---
layout: "post"
location: "Berlin"
title: "Running Love2D from Sublime Text 2 on Windows"
excerpt: "I wanted to use Sublime Text 2 for game programming in Lua with Love2D. It turns out that it's pretty easy to setup a custom build system for ST2."
aliases: ["2012/12/12/running-love2d-from-sublimetext2-on-windows/"]
---

*Update: For updated information on this topic you might want to check out the [Love2D Wiki entry on Sublime Text](http://www.love2d.org/wiki/Sublime_Text_2).*

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
You can also use the built-in console to see the output of your game.

<a href="/assets/images/posts/2012-12-12-running-love2d-from-sublimetext2-on-windows/screenshot.jpg"><img class="screenshot" src="/assets/images/posts/2012-12-12-running-love2d-from-sublimetext2-on-windows/screenshot.jpg" alt="screenshot" width="650" /></a>
