+++
template = "post.html"
location = "Berlin"
title = "Fall update"
aliases = ["2013/10/15/fall-update/"]

[extra]
excerpt = "Things happenend. Here's what I've been up to in the past few months."
+++

Things changed a lot but I didn't feel in the mood to really keep the blog up-to date. Now I'll have to pay for it. This will be quite a lengthy post. I'll go over the recent website changes first, then go on with my second foray into Guild Wars 2. I also started learning Ruby, so I'll go into more detail further down. And there's also an update about my netbook experience. Here's what happened in chronological order.

## One Game A Month
I haven't finished any new games after February. I had a [side-scroller](https://gitlab.com/phansch/shootingstar/tree/master) in the works but that project is still way too over ambitious in terms of content creation. I'm not sure if I will get around to finishing that one. I might start a new game from scratch instead.

## Guild Wars 2 
This topic is really hard for me to talk about because it really messed with my goals and plans for this year. Let this be a warning for future me. After finishing the winter semester at university I lost interest in creating games and started playing games instead. I was caught up in Guild Wars 2 again. The last time was crazy too. I even [had]({% post_url 2012-03-16-character-diversity-in-guild-wars-2 %}) a [blog]({% post_url 2012-03-05-sketchbook-fear-and-horror-in-mmos %}) [dedicated]({% post_url 2012-03-07-this-week-in-guild-wars-2-w10 %}) [to]({% post_url 2012-03-06-elementalist-introduction %}) [the]({% post_url 2012-03-05-this-week-in-guildwars2-w9 %}) [game]({% post_url 2012-03-14-this-week-in-guild-wars-2-w11 %}) before it came out.

This time it took up 5 months of the year. I slowly grew more and more attached to my character. Until there was a point where it only made sense to keep playing. "Otherwise the time I spent playing before that would have obviously been wasted", I reasoned. Meeting a group of nice players and slowly starting to carry responsibility for in-game stuff made it worse.

Luckily there came a point where I grew sick of it. That was at at the end of August. I still remember that moment. I wish I knew what triggered it. It might have taken a few minutes, but I slowly lost all sense of attachment to my characters. It's as if there was a dense cover of fog suddenly removed from my vision. A few days after that I brought myself to delete my Guild Wars 2 characters as well as all my EVE Online characters. I never want to touch MMOs again.

## Ruby
It took me a week to get things going again. I started learning Ruby. Because, why not? The first tutorial I took was the one at [Codeschool](https://www.codeschool.com/courses/try-ruby). After that I stuck with Codeschool and continued with the Ruby courses. However, I felt as if those tutorials skipped a lot of Ruby fundamentals. 

After the first month I un-enrolled from Codeschool to continue with *[Projects](https://gitlab.com/phansch/100-projects/tree/master)*. Projects is a GitHub repository consisting of over 100 programming projects compiled by GitHub user [thekarangoel](https://github.com/thekarangoel). I'm not done with Projects yet but I decided it was about time to give Test Driven Development a try: [Learn Ruby (Solutions)](https://gitlab.com/phansch/learn_ruby_solutions/tree/master) from [testfirst.org/learn_ruby](http://testfirst.org/learn_ruby). I never wrote tests before, so this was a really fun learning experience. 

---

My most recent journey into Ruby is [jou](https://github.com/phansch/jou).

> Jou is a simple command line utility that helps with maintaining a journal file in markdown syntax.

I'm using a journal file to keep track of what I did each day. Like writing a blog post or making changes to the website. It's part of my [gtd](http://en.wikipedia.org/wiki/Getting_Things_Done) process. At some point I got sick of locating and opening my journal file in a text editor, so it only made sense to make life easier. Feel free to give it a try by installing it with `gem install jou`.

## Website changes

As you might have noticed, the website underwent quite some changes:

 * Using Bootstrap 3.0
 * Proper [Portfolio](http://phansch.net/)
 * Feedburner RSS feed has been replaced with a simple [atom.xml](http://phansch.net/atom.xml)

## Netbook / Toolset changes
So, this is the third and last part of my netbook experience. My requirements have changed a lot since I [first]({% post_url 2012-01-01-my-netbook-experience %}) wrote about it. I also modified the setup I described in the [second post]({% post_url 2012-12-28-re-my-netbook-experience %}) a bit.

After using it for roughly two years, my netbook felt very underpowered. The processor was weak and watching HD videos was a thing of the past. The battery was dead and the touchpad was broken. Coupled with the fact that I'm not seriously playing games anymore, I want to get rid of my PC as well.

#### What I want
  * A simple, minimal and lightweight system
  * Keyboard-heavy interface as it's faster
  * As much screen real estate as possible
  * Long battery life
  * 8G memory and a SSD
  * Hardware fully supported by Linux
  * 2 Monitor support

The solution is the Dell XPS 13. It's going to replace my netbook *and* my PC. And it will be able to run my current Linux environment.

### My current environment

* [dwm](http://dwm.suckless.org/) on Linux Mint 15 Xfce with two 24" screens.
* Mail: [mutt](http://www.mutt.org/)
* Todo: [taskwarrior](http://taskwarrior.org/docs/start.html) + [bugwarrior](https://github.com/ralphbean/bugwarrior)
* Calendar: [pal](http://palcal.sourceforge.net/)
* Editor: Sublime Text 3
* Sync: Btsync
* IRC: [Weechat](http://www.weechat.org/)
* Other: Firefox, Skype, VLC, JDownloader
* My [Dotfiles](https://gitlab.com/phansch/dotfiles/tree/master)

Finally, [here's a setup script](https://gist.github.com/phansch/6990647) to install everything from a basic Linux Mint installation. (Use at your own risk.)
