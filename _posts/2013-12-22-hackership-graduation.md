---
title: Hackership Graduation
layout: post
tags:
  - hackership
excerpt: The final week of Hackership Batch 0 has arrived. It's graduation week. This week I added devise authentication and made sure my project looks presentable for the demos.
---
I can't believe how fast the time flew by during Hackership. It is almost holiday time. And by the time this post is published I will be visiting my family already. This week at Hackership, I moved my authentication system to [devise](https://github.com/plataformatec/devise) and made everything [look nice](https://twitter.com/phansch/status/413368624905064448).

On **Monday** I began to setup devise. I wanted to move to devise at some point because it also comes with its own mailing system. This way I don't have to figure out too many things at once. Setting up devise went more smoothly than I anticipated. However there were a lot of failing test - leftovers from the railstutorial. Some of them were still useful. But most of the test cases are now covered by devise.

Sadly I had to stay home on **Tuesday** because I didn't feel very good. I spent a lot of time on Typeracer to further improve my typing speed. I also changed a few vim shortcuts to make things easier. (Feel free to check out my [.vimrc](https://gitlab.com/phansch/dotfiles/blob/master/vimrc)!). I also managed to get devise working properly but still had a few failing tests.

Luckily I didn't catch the flu, so I was back on **Wednesday**. I got a lot of stuff done on Wednesday. The first half of the day I worked on fixing the rest of the failing tests for devise. When I was done with that, it was time for our last Rails Q&A. This time we talked about how to connect your Rails application to an external web service. We actually set up a basic proxy API with the [Wordnik service](http://developer.wordnik.com/).

Once we got that working, it was time to part again and continue working on our own projects. Since my work on the tests was done, I began working on the design of my application. As I already did that before, I had a basic design going after another two hours. Here is a screenshot:

<a href="/assets/images/posts/2013-12-22-hackership-graduation/theme.png" class="thumbnail">
  <img src="/assets/images/posts/2013-12-22-hackership-graduation/theme.png" alt="screenshot">
</a>


On **Thursday** I spent a little more time on the look. I made sure all the forms for user authentication are looking nice. The default devise views don't come with the Bootstrap look by default.

At about 3 pm we went to the big presentation room of betahaus. Since we were going to use it for the graduation ceremony later on, it was nice to get accustomed to it. I wasn't a big fan of public speaking when I started Hackership. Maybe this has changed a little bit by now. Since we were doing daily stand ups and weekly demo sessions, I had a lot of practice.

Anyway, this last time our internal demo session was held on a proper stage. I don't think anyone had a finished project to show. We have learned a lot, but 6 weeks aren't enough to learn a new language/framework *and* have a ready product to present.

After our demo session, it was time to walk through the plans for the graduation ceremony. We basically staged everything beforehand so that there would be no surprises during the actual ceremony. And then it was time for the actual graduation ceremony. It took a little while until everyone arrived, but eventually every seat was taken.

Ben started by giving a short introduction to Hackership and the philosophy behind it. Then it was panel time. I also signed up for the panel and so I found myself sitting in front of 70 people together with 6 other graduates. We shared some of our experiences and answered questions from the audience. People seemed to be genuinely interested. After the panel, we were given our certificates. Below is mine. It also includes code from everyones Hackership project, but it's not included in the picture.

<a href="/assets/images/posts/2013-12-22-hackership-graduation/cert.png" class="thumbnail">
  <img src="/assets/images/posts/2013-12-22-hackership-graduation/cert.png" alt="screenshot">
</a>

With the certificates given out, our organizers announced the [crowdfunding campaign](http://www.indiegogo.com/projects/an-apprenticeship-for-hackers-a-hackership) for the next Hackership Batch. **Hackership is on Indiegogo. Feel free to check it out and maybe help with the funding if you happen to like it.** I already did. After the announcement of the crowdfunding campaign, the ceremony was over pretty much. It was time to meet the audience and talk about what we learned during Hackership.

It was nice talking about my project. I got some very valuable feedback for my touch typing teacher and will start measuring user performance on different typing lessons to figure out what lessons help the users the most. The more data the better. So it seems I still have a lot of things to learn. However, I'm not sure if that will help me with actually learning Ruby on Rails. Instead I might start to contribute to open source Rails projects, like Discourse or Open Streetmap.

So this is it. Hackership is officially over. A couple of us will continue to work together in the new year and help each other with their projects. **Thanks to the organizers and Hackers in Residence and other people who helped to make this happen.** Hackership introduced me to all kinds of awesome people and they helped me overcome my depression and social anxiety. But that's for another post. So this won't be the last post this year. If you have read this far, thank you for actually taking the time to read this!

Have a great holiday!
