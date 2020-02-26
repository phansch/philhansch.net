---
layout: post
title: "Monthly review: January"
excerpt: "Embedded Rust, Notification Guilt & Clippy."
tags:
  - monthly-review
---

## Sponsors

I'm incredibly thankful to the following people for sponsoring my open source
work this past month: [@repi], [@oli-obk] and [@yaahc].

If you like what I'm doing and want to support my work, please [consider sponsoring](https://phansch.net/thanks) :heart:

## What I've worked on

The most interesting thing is probably the addition of a [glossary to the
embedded book][glossary]. I've been [starting with some embedded
development][embedded_post] and have been reading through the existing
documentation to look for improvements.

Another interesting thing, if you're contributing to Clippy, is some
streamlining around Clippy's developer tooling: [I replaced a shell script with a
cargo alias][util_dev] to make contributing easier if you're on Windows.


## Reflections & Goals for February

**This January** I've unsubscribed from Clippy repository because I
couldn't deal with all of them anymore.

<center>
<blockquote class="twitter-tweet" data-dnt="true" data-theme="dark"><p lang="en" dir="ltr">going to try and unsubscribe from all rust-lang/rust-clippy notifications and instead schedule fixed times for doing PR reviews</p>&mdash; #[clippy::phansch] (@philhansch) <a href="https://twitter.com/philhansch/status/1215898420566745088?ref_src=twsrc%5Etfw">January 11, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 
</center>

I have found it increasingly exhausting to try and react to every GitHub
notification. While I admit that it's not required to _respond_ to every
notification properly, I was also feeling bad about constantly marking
notifications as done from my side even though they really weren't done from the
other person's perspective. When I came to that realization, I decided to
unfollow the repository and instead assign fixed time chunks for reviewing PRs.

At the end of the month I unfortunately caught a cold and I'm still partly
recovering from it. Still, I think since unsubscribing from Clippy notifications
I've gained back some of my previous momentum.

For this February I have the following goals:

* Actually starting with embedded development, using the discovery kit
* A second embedded rust post
* [Improving a diagnostic][diag] in rustc

[sponsoring blog post]: https://phansch.net/2019/10/21/sponsoring/
[thanks page]: https://phansch.net/thanks/
[sponsorship profile]: https://github.com/sponsors/phansch
[paypal.me profile]: https://www.paypal.me/philhansch
[@oli-obk]: https://github.com/oli-obk
[@yaahc]: https://github.com/yaahc
[@repi]: https://github.com/repi
[glossary]: https://github.com/rust-embedded/book/pull/223
[util_dev]: https://github.com/rust-lang/rust-clippy/pull/5109
[embedded_post]: /2020/01/14/exploring-embedded-rust-part-1/
[diag]: https://github.com/rust-lang/rust/issues/56982
