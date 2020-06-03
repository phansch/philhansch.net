---
layout: post
title: "Monthly review: December"
excerpt: "Patreon &amp; productive procrastination."
tags:
  - monthly-review
aliases: [""]
---

## New Sponsors

I'm incredibly thankful to the following people for sponsoring my open source
work this past month: [@repi], [@oli-obk] and [@yaahc].

If you like what I'm doing and want to support my work, please [consider sponsoring](https://phansch.net/thanks) :heart:

## What I've worked on

If you're familiar with how this website looks, you can probably tell that it
has a slightly new look. Also, if you were to look into my personal documents
directory, you could most likely tell that it had been recently cleaned and
organized …again. Hello procrastination!

Looking at [the November
review](https://phansch.net/2019/12/02/monthly-review-november/), I have to
admit that I didn't follow through with all the goals I wrote down:

* I absolutely did not continue with the tiny compiler. I'm currently stuck on
  implementing the visitor and I'm honestly not sure if it's worth it to
  continue
* I reviewed _some_ Clippy PRs, but I've felt a lack of motivation in reviewing
  for some reason. I also didn't contribute as much as I used to

I did a few other things, though:

I now have a [Patreon page](https://www.patreon.com/philhansch)! Setting up
Patreon required a lot more work than setting up GitHub sponsoring and I'm still
not 100% happy with it. I would like a nicer header image and improve on the
goals a bit as well.

Apart from the Patreon page, I've been working through Ralf Jung's [Rust
101][rust-101] course to check up on my Rust fundamentals. What I like most
about this course is the focus on exercises. As a result of the course I created
about 25 new flashcards mostly around raw pointers and `std::sync`.

I also [updated the Clippy changelog][changelog] for Rust 1.39 and 1.40.


## Reflections & Goals for January

**This January** I want to try and find my Clippy/Rust motivation again. I think,
after we finished completing the [rustfix testing issue][rustfix-clippy] in
September, I was lacking a new clearly defined goal.

To put down some more precise goals:

* I want to try out embedded rust development to see how it feels and possibly contribute
  back some documentation
* I want to fix [a bug][clippy-bug] where Clippy never stops running.
* I want to continue with [splitting up Clippy's UI test files][clippy-ui] to make the output
  more manageable.

That's all I have for now. See you here for the January review!

[clippy-bug]: https://github.com/rust-lang/rust-clippy/issues/4917
[clippy-ui]: https://github.com/rust-lang/rust-clippy/issues/2038
[rustfix-clippy]: https://github.com/rust-lang/rust-clippy/issues/3630
[patreon]: https://www.patreon.com/philhansch
[fork]: https://github.com/phansch/the-super-tiny-compiler-in-rust
[upstream]: https://github.com/jamiebuilds/the-super-tiny-compiler
[sponsorship profile]: https://github.com/sponsors/phansch
[paypal.me profile]: https://www.paypal.me/philhansch
[@oli-obk]: https://github.com/oli-obk
[@yaahc]: https://github.com/yaahc
[@repi]: https://github.com/repi
[rust-101]: https://www.ralfj.de/projects/rust-101/main.html
[`std::sync::atomic`]: https://doc.rust-lang.org/std/sync/atomic/
[changelog]: https://github.com/rust-lang/rust-clippy/pull/4911
