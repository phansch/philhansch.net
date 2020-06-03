---
layout: post
location: Rheda-Wiedenbrück
title: "RE: My netbook experience"
excerpt: "I have been using Linux Mint and XMonad on my netbook for a while now. This is a review of how I ended up with my current setup and what is left to improve."
aliases: [""]
---

[A year ago](http://phansch.net/2012/01/01/my-netbook-experience/), I wrote about my first experiences with the *Asus EeePC 1215N*. It's time that I do another review of my netbook usage.

I've been running Windows 8 for about two weeks before I removed it. I was unable to connect to my university's eduroam network due to faulty drivers. 
Before that, my netbook was running on Windows 7. Running Windows 7 was quite effortless. The reason I gave Windows 8 a try was keyboard accessibility. The new <span class="key">Win</span> + <span class="key">X</span> keyboard shortcut is awesome. The new task manager and file transfer dialog are nice as well. But those just didn't cut it.

The thing is, that my netbook crashed down *twice*, from 1m height. Because of that, my touch-pad broke and now it stops working a few minutes after start-up. With Windows, I had to bring a mouse with me every time I wanted to use the netbook for longer.
After Windows 8, I decided to give Linux another try. I heard about [XMonad](http://xmonad.org), a tiling window manager, a couple times before, so it was time to reevaluate my netbook usage.


What I wanted
-------------

 * A fast and lightweight system
 * Long battery life
 * Simple application launcher
 * Easy note-taking – without a distracting Internet browser
 * Simple 2D game programming
 * Everything should be accessible by the keyboard, due to a broken touch-pad
 * As much screen real estate as possible

My setup
--------

#### Linux Mint (MATE)
Frankly, it doesn't really matter what distribution you are using. I opted for Linux Mint because it comes with proper media support and working wireless drivers. After trying the Cinnamon and the MATE desktop, I must say that the Cinnamon desktop felt a bit sluggish compared to the MATE desktop.
I also tried a minimal Debian setup, but I couldn't get the wireless working. If wireless worked out of the box on Debian I probably would have sticked with it.

#### XMonad

I have been using XMonad for over a month now. I really like it. There are no window decorations and there is no mouse required to do anything.
Windows are closed with <span class="key">Win</span> + <span class="key">Shift</span> + <span class="key">C</span> and that's basically it. Depending on the current layout, the size of the active window can be increased with <span class="key">Win</span> + <span class="key">H</span> and decreased with <span class="key">Win</span> + <span class="key">L</span>. To switch between windows, I use <span class="key">Win</span> + <span class="key">Tab</span>.

My XMonad config just adds a few custom keyboard shortcuts:

 * <span class="key">Win</span> + <span class="key">Shift</span> + <span class="key">Enter</span> open `gnome-terminal`
 * <span class="key">Win</span> + <span class="key">Shift</span> + <span class="key">P</span> open `dmenu`
 * <span class="key">Win</span> + <span class="key">Shift</span> + <span class="key">V</span> open `virtualbox`
 * <span class="key">Win</span> + <span class="key">S</span> Shutdown 
 * <span class="key">Win</span> + <span class="key">Shift</span> + <span class="key">S</span> Suspend

If you want to see how XMonad can be used, take a look at the [config archive](http://www.haskell.org/haskellwiki/Xmonad/Config_archive#Configs_for_the_current_XMonad_release_.280.9..2A.29).

#### Filesystem access to Google Drive

Sadly there is no official Google Drive client for Linux. Therefore you have to rely on third party developers. 
To access Google Drive on Linux, you have two options:

 1. [Grive](https://github.com/Grive/grive)
 2. [Insync](https://www.insynchq.com/)

The main difference between both is that Grive doesn't sync automatically. You have to tell it to sync. Grive also doesn't support symbolic links.
Insync, on the other hand, is a fully functional Google Drive client. Although, the GUI is not working for me. I just keep the application running in the background and it will do the syncing. 


#### Sublime Text 2 for writing and web stuff
 
I [recently](http://phansch.net/2012/12/12/running-love2d-from-sublimetext2-on-windows) talked about setting up custom Build Systems for Sublime Text 2. Currently I have a build system to build a Love2D project, one for `pdflatex` and a build system to preview a markdown file in google chrome. I have a small set of shortcuts that I regularly use. I think they are common knowledge, but here are they anyway:

 * <span class="key">Shift</span> + <span class="key" title="Right Mouse Button">RMB</span> to select columns
 * <span class="key">Shift</span> + <span class="key">Alt</span> + <span class="key">up</span> or <span class="key">down</span> to select columns
 * <span class="key">Ctrl</span> + <span class="key">Shift</span> + <span class="key">P</span> to open the Command Palette
 * <span class="key">Ctrl</span> + <span class="key">B</span> to use the current build system on the current file.
 * <span class="key">F6</span> for spell-checking

I also put the settings for ST2 on Google Drive. On a new machine, I can then create symlinks to Google Drive and have the settings and plugins quickly available.

#### NetBeans for Java programming class

While Sublime Text 2 is an awesome piece of software, I am pretty lazy. At some point, I want to use ST2 to do all the Java stuff for university.
Until then, I'll be using NetBeans. In NetBeans I got rid of a lot of unnecessary UI. I also disabled a lot of plugins to make NetBeans start up faster. It still takes 20 seconds, but that was a huge improvement already.

What requires fixing
--------------------
There are a couple things left to do, that could save some time. 

 * My git login is not saved to the gnome keyring. Have to login for every push
 * I still struggle with navigating websites by keyboard. 
 * Use Sublime Text to work on Java assignments.
 * A few Google Chrome plugins don't sync their settings.

-----

To wrap things up, I can say that I am really happy with my setup. It was a bumpy road to get there but I think it pays off. The battery lasts for around 4 hours with wireless. For note-taking I use Sublime Text 2 and save notes as markdown. With XMonad, pretty much everything is accomplishable by keyboard shortcuts. And I finally have enough screen space available to do some programming on my netbook.
