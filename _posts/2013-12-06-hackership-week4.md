---
layout: post
title: Hackership Week 4
tags:
  - hackership
excerpt: This week I worked on implementing the models for lessons and practices so that data is available for every single practice.
aliases: [""]
---

This week I worked on implementing the models for lessons and practices so that data is available for every single practice.
I also tried to wrap my head around CoffeeScript but it seems that I should learn more about javascript first.

We started the week with our usual Monday morning breakfast and decided on our goals for the week. After the breakfast I started working on creating the
models and migrations for Lessons and Practices. I spent an hour planning the initial database structure and then went on to create the models, associations and migrations.

The first thing I did on **Tuesday** was cleaning up the database model as there were a couple unused attributes. I then went on and re-organized my `routes.rb` as it was getting a little unwieldy with the new models. Me and a few other learners also got interviewed by [@e_w](https://twitter.com/visavis_kid) about our Hackership experience. The interview videos will be part of a short video about the first Hackership batch. I also gave the [shoulda](https://github.com/thoughtbot/shoulda) Gem a try. This is a gem that allows for easy testing of model associations.

Once my tests were green, I started working on my Anki cards collection. When I started with Hackership, I wanted to see how spaced repetition could improve my learning. I started taking notes of things that I looked up again and again. One example would be unpacking bzip and gzip files on Linux: `tar xvjf files.tar.bz2` - I had a really hard time remembering the arguments until I put it into my Anki collection.


On **Wednesday** I had to make up for not writing enough tests in the previous two days. I started learning more about FactoryGirl and also installed the [database_cleaner](https://github.com/bmabey/database_cleaner) Gem. Then I wrote some tests for a couple helper methods I've written before. We also had a 2 hour long Rails Q&A session where we talked about [concerns](http://37signals.com/svn/posts/3372-put-chubby-models-on-a-diet-with-concerns) and the [devise](https://github.com/plataformatec/devise) Gem.


It was CoffeeScript time on **Thursday**. I tried. I tried really hard to understand CoffeeScript scoping. But it seems that without proper Javascript knowledge this is very hard. That makes refactoring very difficult and my current code is not very maintainable. I don't think that I have enough time to improve on it before Hackership ends. Another thing that happened, was an introduction to GitHub by [@lstoll](https://twitter.com/lstoll), [@muanchiou](https://twitter.com/muanchiou), [@vmg](https://twitter.com/vmg) and [@jdennes](https://twitter.com/jdennes). They explained pull requests and a couple more features of GitHub, like commenting on specific lines on a commit.

---

I did get everything done that I had planned for this week. I also went to the [Ruby Meetup](http://berlin.onruby.de/events/december-meetup-2013) on Thursday and met a lot of new people. Next week I'm going to work on displaying errors the user makes and jumping to specific lessons.
