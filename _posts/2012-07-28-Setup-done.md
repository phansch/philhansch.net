---
layout: post
location: Berlin
title: Setup done
---
It took me about two days to get everything set-up. The first day was spent with learning the basics of jekyll, liquid and markdown. 

The second day was littered with small challenges and quite a few problems. But problems are there to be solved. So here's my summary of day #2:


### Setup a local test environment###
First thing I did, was figuring out how to setup a local testing environment. The previous day I did 80 commits for testing purposes. That was a little bit too much, in my eyes. Luckily there are quite a few tutorials on how to setup such a test environment. [This](http://ntotten.com/2012/03/02/github-pages-with-jekyll-local-development-on-windows/) is the one I used (My desktop machine is running Windows 7). All you need is ruby, the ruby dev kit, jekyll, rdiscount and a clone of your repository.

<a href="/assets/images/posts/2012-07-28-Setup-done/commit-frequency.png"><img src="/assets/images/posts/2012-07-28-Setup-done/commit-frequency.png" width="610" alt="commit frequency" title="From 80 down to 18 commits." /></a>

So, from 80 commits without a testing environment I went down to 18 commits on day 2. 

### Importing blog posts from Wordpress ###
As I wanted to keep my old blog posts archived, I looked for ways to convert the Wordpress export xml file to markdown. I eventually found [thomasf/exitwp](https://github.com/thomasf/exitwp/) which does exactly what I needed. All that was left to do was getting rid if `[caption]` tags, making the code look nicer and some general formatting. 

I also removed tags and categories from each post as I'm not making use of them. Sadly, embedded YouTube videos were removed by exitwp, so I had to put them in again. 

The last thing that was on my list was the code formatting. Apparently there is [GitHub flavoured markdown](http://github.github.com/github-flavored-markdown/). Except that it didn't seem to work on here. After I've spent some time messing around with that, I simply used the basic markdown syntax for code. No syntax highlighting, sadly.
This is also where most of the commits came from. Obviously, GitHub flavored markdown is not available in a local testing environment, so I had to test it on GitHub.

### My own theme ###
This theme is a fork of [Tom's theme](http://themes.jekyllbootstrap.com/preview/tom/). A few changes to the font, a new archive page and a different footer - That's all I changed. But it's not finished yet. I'm planning to add a "fork me" badge and I might change the footer a little bit. But so far I'm pretty much done.
