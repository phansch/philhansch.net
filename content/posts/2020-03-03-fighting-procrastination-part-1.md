+++
template = "post.html"
title = "Fighting my procrastination: Part 1"
aliases = ["2020/03/03/fighting-procrastination-part-1/"]

[extra]
excerpt = "Firefox extensions and /etc/hosts."
+++

Hi, this post is going to be part of a series about productivity,
procrastination and how to form better habits around open-source work.

I can be a terrible procrastinator. Sometimes it's productive procrastination,
other times it's just browsing Reddit or watching YouTube videos. With these
posts I want to share some of my approaches to keep my procrastination at a
non-destructive level.

In retrospect, one key part of this battle has been to move my procrastination
away from the computer and internet and to only use my computer for
non-procrastination things. This post describes the key parts that are working
for me right now.

## Firefox Extensions

I'm using two Firefox extensions to limit some of my procrastination:

* **[Youtube Unhooked]** is a small extension that will block the more useless parts
  of youtube, such as recommendations, related videos and of course, the
  comments. I found this useful mostly for hiding the related videos section.

* **[Facebook News Feed Eradicator]** is another very focused extension that will
  hide the Facebook news feed. This is useful because I pretty much only use
  Facebook for the events part.

You have probably already heard of **[LeechBlock]**. It worked for me for a
few weeks but I got into the habit of just going to `about::addons` and
disabling it... Which brings me to my current solution for blocking websites.

## `/etc/hosts` blocklist with cronjob

As a replacement for LeechBlock, I've been utilizing my `/etc/hosts` file for
some time now. Editing it requires me to enter my sudo password which makes it a
bit more difficult to unblock blocked sites. However, it was not difficult
enough. I ended up removing sites from the file and never got around to
add them again.

To solve that problem, I now have an [Ansible playbook][ansible_playbook] that
creates a cronjob which runs every 2 minutes. The cronjob resets the `/etc/hosts`
file to the contents of a `/etc/hosts_base` file where all of my go-to
procrastination sites are blocked.

I have found this to work _surprisingly_ well.

Of course, this has potential to fall apart if I start editing `/etc/hosts_base` but
so far that hasn't been the case.

## An ongoing fight

I don't claim to have found a perfect solution here. It's more the case that I
think that fighting procrastination is a never ending battle. I will always find
some way to procrastinate. However, by at least limiting some of the bad habits
on my computer, I think that I'm more likely to produce something of value when
I'm using it without distractions.

[LeechBlock]: https://addons.mozilla.org/en-US/firefox/addon/leechblock-ng/
[Youtube Unhooked]: https://addons.mozilla.org/en-US/firefox/addon/youtube-unhooked/
[Facebook News Feed Eradicator]: https://addons.mozilla.org/en-US/firefox/addon/news-feed-eradicator/
[ansible_playbook]: https://github.com/phansch/dotfiles/blob/35486702f404d6ba4ed514e612a4d20a93e6a41a/ansible/playbooks/procrastination.yml#L11
