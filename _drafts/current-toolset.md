---
title: Improve your console game
layout: post
excerpt: Awesome command line productivity with tmux and tmuxinator
---

This is what I have been using for a couple weeks now and it's so amazing, I have to share it with you.
Up until a few months ago, I was using the standard command line application of my OS. Now, there's nothing wrong with it, but I always like to work on improving my tools.

For one, switching tabs in the terminal was inconvenient. Then the different tab setup every day made it hard to get used to a specific pattern.

I have been using tmux for a couple months now, but I felt I was just using it's basic features, like tabs and split.

## You can easily get started with tmux

On Ubuntu, run `sudo apt-get install tmux` to install tmux.
On Mac, `brew install tmux` should do the trick.

<small>(it's short for *terminal multiplexer*)</small>

The idea of tmux is that you have one single terminal window with multiple tabs inside. In each tab you have the ability to split up your window into multiple panes.

Here are some tmux settings to get you started with some sane settings:

    # Renumber windows sequentially after closing any of them
    # Otherwise if you close the second tab of three, you
    set -g renumber-windows on

    # set window and pane index to 1 (0 by default)
    set-option -g base-index 1
    setw -g pane-base-index 1

    # Allows for faster key repetition
    set -s escape-time 0

Open new tabs with <span class="key">ctrl</span> + <span class="key">b</span> + <span class="key">c</span>, close them with <span class="key">ctrl</span> + <span class="key">b</span> + <span class="key">x</span>

Switch between tabs using <span class="key">ctrl</span>+  <span class="key">b</span> + <span class="key">tab-number</span>

You can find my whole .tmux.conf [here](https://github.com/phansch/dotfiles/blob/master/tmux.conf).

So for example for writing this blog post, I have a tab with vim, another tab with a local jekyll instance and a third tab with the tmux config right now.

The great thing about tmuxinator is that it allows you to script everything there is to script about it

#### Pairing
You can attach to other people's tmux sessions.

## Enter tmuxinator
But after using this for a couple months, I got sick of reopening the same setup every day.
Enter tmuxinator. tmuxinator allows you to create scripts for tmux, that will open whatever you specified in the script.


 * What is tmux
 * Automate things easier with tmuxinator
