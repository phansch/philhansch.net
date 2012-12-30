---
layout: post
location: Berlin
title: Hello GitHub!
---
I came here after using Wordpress for over two years. 
I always want to keep stuff as simple as possible: I don't need a dashboard, plugins, a media library or a link database. Neither do I need a theme database, a user database or a WYSIWYG editor to create a blog post. That stuff is over-kill. And that was going through my mind the whole time. 
Today I pretty much dived head-on into github, jekyll and liquid to create this first post. And it was a blast. I learned so many useful things. But what I like most about this new setup is that, apart from the initial setup, there is almost no maintenance required. Whereas in popular blog software, you have to deal with frequent software updates, backups and broken plugins or broken themes.

I will try to write about my experiences with jekyll and liquid as I move on. Here's a summary of day #1:

### Setting up github ###
This is not the first time I tried to get into using github. I admit that previously I had no idea what to use it for. But yesterday I stumbled upon [pages.github.com](http://pages.github.com) and I was immediately intrigued. So today, I downloaded the github app for windows and created my first repository. This was pretty straightforward and right now I prefer the GUI over the command line.

### Getting to know jekyll and liquid ###
The first documentation I found, was [this one](https://help.github.com/categories/20/articles). It wasn't very helpful as it didn't explain how to actually create a page or even a blog. Turns out, I was looking in the wrong place. [jekyllbootstrap.com](http://jekyllbootstrap.com/) was the biggest help, especially the [introduction](http://jekyllbootstrap.com/lessons/jekyll-introduction.html). 
With the proper documentation at hand I quickly made progress and soon had my first template/page setup working. From there it was only a surprisingly small step to a blog.

### How this blog works ###
[This markdown file](https://github.com/phansch/phansch.github.com/blob/master/_posts/2012-07-26-HelloGitHub.md) contains all the text for the blog post. The YAML front matter at the top specifies the layout for the blog post, the category, tags and a title. [The layout file](https://github.com/phansch/phansch.github.com/blob/master/_layouts/post.html) contains html and a content variable that is replaced with the blog post by jekyll. You might notice that the *post.html* layout file has a layout defined. The [default layout](https://github.com/phansch/phansch.github.com/blob/master/_layouts/default.html) will replace the content variable with the post layout.

### Publishing ###
I'm using Sublime Text 2 to create the blog posts in markdown. Once I'm done writing a blog post I commit the file to the *\_posts* folder in my [phansch.github.com repository](https://github.com/phansch/phansch.github.com). That's all there is to publishing. (It might take a few minutes until the changes show up.)