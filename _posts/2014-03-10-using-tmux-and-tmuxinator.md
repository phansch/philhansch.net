---
title: "Using tmux and tmuxinator"
layout: "post"
excerpt: "Awesome command line productivity with tmux and tmuxinator"
aliases: ["2014/03/10/using-tmux-and-tmuxinator/"]
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

You can open new tabs with <kbd>ctrl</kbd> + <kbd>b</kbd> + <kbd>c</kbd> and close them with <kbd>ctrl</kbd> + <kbd>b</kbd> + <kbd>x</kbd>.

To switch between tabs use <kbd>ctrl</kbd> +  <kbd>b</kbd> + <kbd>tab-number</kbd>.

Open new panes with <kbd>ctrl</kbd> +  <kbd>b</kbd> + <kbd>%</kbd> / <kbd>"</kbd>.

To switch between panes use <kbd>ctrl</kbd> + <kbd>b</kbd> + <kbd>o</kbd>

## Tmux configuration
Tmux configuration is saved in `~/.tmux.conf`. I recommend adding the following lines to your configuration since the defaults aren't really nice.

```conf
# Renumber windows sequentially after closing any of them.
# Otherwise if you close the second tab of three, you end
# up with tabs numbered 1 and 3.
set -g renumber-windows on

# set window and pane index to 1 (0 by default)
set-option -g base-index 1
setw -g pane-base-index 1

# Allows for faster key repetition
set -s escape-time 0
```

Also, [here](https://gist.github.com/MohamedAlaa/2961058) is a great cheatsheet for the most important tmux shortcuts.

## Save time with tmuxinator
Tmux comes with an extensive command line interface, but it can be a little bit difficult to figure out. Tmuxinator makes use of the commands that tmux comes with, but it extracts all the complexity into a single yaml file:

```yaml
name: railsproject
root: ~/code/railsproject

windows:
  - editor: vim
  - console: rails c
  - git:
  - logs:
    layout: even-horizontal
    panes:
      - tail -f log/development.log
      - tail -f log/test.log
  - server: rails s
  - heroku: heroku logs -t
```

With this file in place, you can now run `mux railsproject` and everything will be started automatically.

This is liberating in so many ways. In the morning, you don't have to remember what tools you need for the project you're working on. Throughout the day you can rely on keyboard shortcuts always bringing you back to the same program.
And then you quickly get used to the patterns with your project specific settings. I found that I can stay focused way better this way. The tab for logs, server, console and editor are always the same.

I encourage you to give tmux and tmuxinator a try. If you happen to run into problems, feel free to leave a comment and I will see what I can do.

You can find my whole .tmux.conf [here](https://gitlab.com/phansch/dotfiles/blob/master/tmux.conf). Additionally some of my tmuxinator configuration files are located [here](https://gitlab.com/phansch/dotfiles/tree/master/tmuxinator).
