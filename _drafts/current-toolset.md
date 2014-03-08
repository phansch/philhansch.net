---
title: Improve your console game
layout: post
excerpt: Awesome command line productivity with tmux and tmuxinator
---

This is what I have been using for a couple weeks now and it's so amazing, I have to share it with you.
Up until a few months ago, I was using the standard command line of my OS. Now, there's nothing wrong with it, but I always like to work on improving my tools.

For one, switching tabs in the terminal was inconvenient. Then the different tab setup every day made it hard to get used to a specific pattern.
This is no longer a problem with [tmux](http://en.wikipedia.org/wiki/Tmux) and [tmuxinator](https://github.com/tmuxinator/tmuxinator).

*Tmux* is short for terminal multiplexer which is a fancy way for saying that it allows you to switch between multiple programs in one terminal. Tmux can do much more, but I am going to focus on window management for this post.

*Tmuxinator* allows you to easily script tmux sessions. I am using tmuxinator to setup different window layouts for each of my projects.


## Tmux windows and panes

The idea of tmux is that you have one single terminal window with multiple tabs inside. In each tab you have the ability to split up your window into multiple panes.
To start a simple tmux session just run `tmux`.

You can open new tabs with <span class="key">ctrl</span> + <span class="key">b</span> + <span class="key">c</span> and close them with <span class="key">ctrl</span> + <span class="key">b</span> + <span class="key">x</span>.

To switch between tabs use <span class="key">ctrl</span> +  <span class="key">b</span> + <span class="key">tab-number</span>.

Open new panes with <span class="key">ctrl</span> +  <span class="key">b</span> + <span class="key">%</span> / <span class="key">"</span>.

To switch between panes use <span class="key">ctrl</span> + <span class="key">b</span> + <span class="key">o</span>

## Tmux configration
Here are some basic tmux settings to get you started with some sane settings.
You can find the file in ~/.tmux.conf

    # Renumber windows sequentially after closing any of them.
    # Otherwise if you close the second tab of three, you end
    # up with tabs numbered 1 and 3.
    set -g renumber-windows on

    # set window and pane index to 1 (0 by default)
    set-option -g base-index 1
    setw -g pane-base-index 1

    # Allows for faster key repetition
    set -s escape-time 0

Also, [here](https://gist.github.com/MohamedAlaa/2961058) is a great cheatsheet for the most important tmux shortcuts.

## You can easily get started with tmux

On Ubuntu, run `sudo apt-get install tmux` to install tmux.
On Mac, `brew install tmux` should do the trick.




So for example for writing this blog post, I have a tab with vim, another tab with a local jekyll instance and a third tab with the tmux config right now.


#### Pairing
You can attach to other people's tmux sessions.

## Enter tmuxinator
But after using this for a couple months, I got sick of reopening the same setup every day.
Enter tmuxinator. tmuxinator allows you to create scripts for tmux, that will open whatever you specified in the script.


 * What is tmux
 * Automate things easier with tmuxinator

You can find my whole .tmux.conf [here](https://github.com/phansch/dotfiles/blob/master/tmux.conf).
