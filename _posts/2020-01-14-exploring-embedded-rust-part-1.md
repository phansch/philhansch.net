---
layout: post
title: Exploring Embedded Rust - Part 1
excerpt: Starting to figure out embedded development
---

Coming from a web development background, lower level things can sometimes feel very
foreign, especially when your code only ever runs in a languages VM.

I was in the audience for James Munns' ([@jamesmunns]) [talk about Embedded
Development][youtube] at the Berlin Rust meetup last year. At the time of this
writing that was 9 months ago and I've now decided to give embedded development
a try. I'm going to write this post as I go along.

Since I don't really have a project that I want to work on, my initial goal is
to find out how it is like to work on embedded systems and how approachable the
documentation is. I've worked with a Rasperry Pi briefly and got an LED
blinking, but that was 5 years ago, [using Processing][Processing].

## Getting Started

Searching the internet for 'rust embedded book' gave me [the
rust embedded book][the_book] as a result. Before going through this book
though, I'll re-watch James Munns' talk and make some proper notes of it.

<a href="/assets/images/posts/2020/life-before-main-notes.jpg" class="thumbnail" style="float: left">
  <img src="/assets/images/posts/2020/life-before-main-notes.jpg" alt="screenshot" width="250" />
</a>

With the notes done, it's time to grab another coffee and start reading the
book. The 'Assumptions and Prerequisites' section makes me think that I'm not
the perfect target audience for this book, because apart from the Rasperry Pi,
I've never debugged any embedded system.

<br>
Luckily I found the [Discovery book][discovery-book] via the bookshelf which is
linked in the table on the first page. It seems that this is the book one should
work through first. I've [opened a PR][book-pr] to mention the discovery book a bit more
prominently.

As it seems like the discovery book works with the hardware immediately, I'm
going to jump back to the [QEMU section of the embedded book][qemu]. Once my
hardware arrives I'll return to the discovery book.

Following the installation instructions worked without problems. It seems like
the majority of the tooling so far consists of QEMU, GDB and only a handful of cargo
crates.


## Hardware!

<a href="/assets/images/posts/2020/discovery.jpg" class="thumbnail" style="float: left">
  <img src="/assets/images/posts/2020/discovery.jpg" alt="screenshot" width="200" />
</a>

My device arrived and following the included instructions worked without
problems until I tried using the USB interface. It turned out that my old Mini
USB cable didn't work. I'm not sure why but I think it might be because it
doesn't support data transfer.


I went to the local electronics store, bought a new one and [opened another
PR][discovery-pr] (already merged :heart:) to mention the data transfer requirements for the cables.
After that I also opened another [issue][glossary-issue] which proposes a
Glossary for the embedded book. I'm hoping to get to that by the end of January,
unless someone else is faster.



I think this is a good point to wrap up this post as I won't be able to get back
into it for a few days. In the next post I'm going to try writing my first embedded
Rust program following the discovery book.

[Processing]: https://processing.org/
[the_book]: https://rust-embedded.github.io/book/intro/index.html
[youtube]: https://www.youtube.com/watch?v=RIHVoNDxNuk
[img-notes]: /assets/images/posts/2020/life-before-main-notes.jpg
[img-discovery]: /assets/images/posts/2020/discovery.jpg
[@jamesmunns]: https://github.com/jamesmunns
[book-pr]: https://github.com/rust-embedded/book/pull/219
[glossary-issue]: https://github.com/rust-embedded/book/issues/220
[discovery-pr]: https://github.com/rust-embedded/discovery/pull/201
[discovery-book]: https://docs.rust-embedded.org/discovery/index.html
[qemu]: https://rust-embedded.github.io/book/start/qemu.html
