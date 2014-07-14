---
title: "Sideproject: Screenshot Streamer"
layout: post
excerpt: My most recent side project. An image streaming server using Sinatra.
---
Time for another side project! This is a project for the upcoming [Ludum Dare game making competition](http://www.ludumdare.com/compo/).

## What this is about

I want to participate in the next game making competition for Ludum Dare. The [last time I participated](http://phansch.net/2012/12/26/ludum-dare-25-post-mortem/), I created a [screenlapse](https://www.youtube.com/watch?v=eX7fsD3Hbmc) of my work over the weekend.
This time I want to do that again, but with a twist. I'm planning to live stream my work over the weekend.

However, this is not your usual video livestream. It will be images from the screenlapse recording output. A new image every 30 seconds. Since my laptop is not powerful enough to do actual video livestreaming, I hope this will be an interesting alternative.

Here's a preview of how it might end up looking like:

<a href="/assets/images/posts/2014-04-13-sideproject-screenshot-streamer/frontend.png">
  <img src="/assets/images/posts/2014-04-13-sideproject-screenshot-streamer/frontend.png" class="img-thumbnail" alt="project screenshot">
</a>
Additionally, older screenshots will be displayed as thumbnails at the bottom.

## New things learned!

The image livestreaming server is pretty much done and there's just a few finishing touches left. It is not available online yet, but the source code is available [here on GitLab](https://gitlab.com/phansch/screenshot-streamer/tree/master). The server itself can be found in the [app.rb](https://gitlab.com/phansch/screenshot-streamer/blob/master/app.rb). It is built with Sinatra and provides a `text/event-stream` route for a client that uses the [EventSource API](https://developer.mozilla.org/en-US/docs/Web/API/EventSource). The other important route is `post '/screenshot/:filename'`, which provides an interface for someone to push new images to the server. This route is also [protected with HTTP Basic Auth](https://gitlab.com/phansch/screenshot-streamer/blob/master/helpers/auth.rb), so that only authorized people (i.e me) can post screenshots.

The client code can be found in [views/index.erb](https://gitlab.com/phansch/screenshot-streamer/blob/master/views/index.erb). The frontend part is also quite interesting: Once a new image gets posted to the server, it will show up in all connected clients without reloading. The old image will be moved to the list of thumbnails while the top image gets replaced with the new image. I extracted the code responsible for moving the images into a small Jquery plugin, which can be found [here](https://gitlab.com/phansch/screenshot-streamer/blob/master/public/js/MoveImages.js). I also wrote tests in Jasmine, because it got very tedious to test the frontend code. The tests can be found [here](https://gitlab.com/phansch/screenshot-streamer/blob/master/spec/javascripts/MoveImage.spec.js).

I am really happy about this little project coming together because I learned so many new things. I never used Sinatra before. I had JavaScript testing on my list of things to do anyway and coincidentally, Jquery plugins make testing a lot easier.

## What's left to do

The most important part that is missing, is a tool that automatically posts images to the server. Additionally I'd like to automatically remove images from the server once they aren't needed anymore. And tests for the Sinatra app. Other than that, I'm really looking forward to the next [Ludum Dare](http://www.ludumdare.com/).

Have a great time!
