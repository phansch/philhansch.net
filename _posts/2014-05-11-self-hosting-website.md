---
layout: post
title: "The Setup Part 1: Website"
excerpt: First part of a longer series on moving my stuff away from the cloud and maintaining a proper laptop setup.
---

This series will have a focus on DIY computer stuff, privacy issues, automation and security related topics.

One thing I want to achieve this year, is independence from most customer cloud services. Customer cloud services meaning services that I use for personal stuff.
That includes stuff like Google Mail, Google Calendar, GoogleDocs/Dropbox and many more.

---

As a first step, one thing I recently did was moving my blog away from GitHub Pages. This blog is now hosted on my own server. This costs a little money, but I have full control over the environment. The setup is different for each provider, but essentially it's a git post-receive hook that triggers jekyll to build the page:


{% highlight bash %}
# $HOME/website.git/.git/hooks/post-receive
GIT_REPO=$HOME/website.git
TMP_GIT_CLONE=$HOME/tmp/website
PUBLIC_WWW=$HOME/html

. $HOME/.bash_profile
git clone $GIT_REPO $TMP_GIT_CLONE
$(which jekyll) build -s $TMP_GIT_CLONE -d $PUBLIC_WWW
rm -Rf $TMP_GIT_CLONE
exit
{% endhighlight %}
More information about deploying with jekyll can be found [here](http://jekyllrb.com/docs/deployment-methods/).

It's important to note that if you are planning to move away from GitHub Pages, you don't necessarily need a hoster that offers Ruby support. All you need is a webserver that can serve static files. You would first generate your blog with `jekyll` locally and then upload it it your server via FTP.

After moving the website away from GitHub, I also moved most of my GitHub repositories to GitLab. As a result, most of the links to my GitHub repositories have to be changed at some point. A mirror of this websites repository is available on [GitLab](https://gitlab.com/phansch/phansch-net/tree/master).

I haven't written any other posts for this series yet, but potential next topics include: Owncloud, Laptop Setup, Backups, Email, Password Management and Android liberation.
