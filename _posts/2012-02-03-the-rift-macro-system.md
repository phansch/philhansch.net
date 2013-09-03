---
comments: true
date: 2012-02-03 12:24:48
layout: post
slug: the-rift-macro-system
title: The Rift macro system
wordpress_id: 1300
---

As you may or may not know, I have a gaming section over at [games.phansch.de](http://games.phansch.de) where I keep stuff for various games.
Most importantly, I wrote a [macro translator](http://games.phansch.de/rift/macro/index.html) that translates Rift macros written in English, to German and the other way around. Today, I want to talk about the pitfalls of Rift's macro and command system and possible solutions. 


### Introduction

When I started playing Rift, I would usually use the English client because I preferred the English forums over the German forums for its up-to-date guides and tutorials. Still, I was playing on a German server because I preferred to play with people who speak my native language (being lazy here!).

As mentioned, I was always more in touch with the international community than the German community, except for my guild. I was [quite active on telarapedia](http://telarapedia.com/wiki/Special:Contributions/Plyturon), for example. The downside of using the English client was, that communicating with my guild was sometimes difficult. So I eventually switched to the German client. And here the trouble begins.

I quickly noticed that all my macros stopped working. Apparently Trion localized parts of the macro syntax into German! So I started to figure out what was going on ~


### What’s so wrong

The way Rift macros are localized into the additional supported languages (German and French) is kind of weird.

First of all, when using a localized client, the macro system expects the localized ability/item names, not the English ones, which is fine. Furthermore, certain key modifiers have been localized. For example, _[ctrl]_ becomes _[strg]_ in German. And most importantly all the emotes are localized.

And here the real trouble begins. Some parts aren't localized. Take the _/cas_t command. It works in the German client as well and there doesn't seem to be a translation for it. As well as the _suppressmacrofailures_ command. However, there once was a German translation available for it but stopped working a few updates ago.

<!--[![](http://wpimages.phansch.de/2012/02/macro.jpg)](http://wpimages.phansch.de/2012/02/macro.jpg)-->

Then there are certain emotes in the German client that allow you to use both the English and the German command: _/dance_ and _/tanzen_ will both work in the German client! These are just a few examples I stumbled across when I was writing up the [Commandlist](http://telarapedia.com/wiki/Commands) over at Telarapedia during beta. 

### Possible solutions


The most obvious solution would be for Trion to streamline the command and macro system. Adding a documentation of what is possible and what isn't, is needed anyway. The _/help_ command which just prints the list of commands is just not enough. However, that will require a lot of work. And the small macro system probably isn't worth the work. It works fine, as long as people don't change the client language.

For me, there's also the option to move to an English speaking server. And I might end up doing that soon.
