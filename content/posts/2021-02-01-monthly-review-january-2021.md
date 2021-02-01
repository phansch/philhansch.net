+++
template = "post.html"
title = "Monthly review: January"
tags = ["monthly-review"]

[extra]
excerpt = ""
+++

## Sponsors

[Embark Studios][embark] continued to support my work throughout January.

They have been supporting all kinds of open source Rust contributors this past
year and are a huge boon to the Rust community. I'm exited to work with them to
bring more Clippy features on the way!

I also want to thank the following people for continued sponsorship of my open
source work this past month: [@repi], [@oli-obk] and [@yaahc].

If you like what I'm doing and want to support my work as well, please consider
sponsoring me on [Patreon][patreon] or [via other
means](https://phansch.net/thanks) 🧡

## What I've worked on

7 contributions got merged this month:

* [Clippy: Fix false positive in `field_reassign_with_default`](https://github.com/rust-lang/rust-clippy/pull/6553)
* [Clippy: Update CHANGELOG for Rust 1.50](https://github.com/rust-lang/rust-clippy/pull/6520)
* [Clippy: Fix blessing of test output in subdirectories](https://github.com/rust-lang/rust-clippy/pull/6525)
* [Clippy: Tiny symbol cleanup](https://github.com/rust-lang/rust-clippy/pull/6551)
* [Clippy: Improve internal tool error handling](https://github.com/rust-lang/rust-clippy/pull/6656)
* [compiletest-rs: Run `cargo test` on CI](https://github.com/laumann/compiletest-rs/pull/229)
* [compiletest: Add two more unit tests](https://github.com/rust-lang/rust/pull/81428)

I've reviewed and approved [12 pull requests][reviewed].

In addition to that I currently have two open pull requests in `compiletest-rs`:

* [Moving CI to GitHub Actions](https://github.com/laumann/compiletest-rs/pull/232)  
  Nothing exciting, but CI is currently not working at all because Travis CI
  stopped working
* [Adding `bless` support](https://github.com/laumann/compiletest-rs/pull/231)  

Finally, I started a new Rust side project: [webdriver-install]. As the name
suggests it manages the installation, updating and removal of webdrivers, such
as `chromedriver`. Currently it supports the installation of `chromedriver` and
`geckodriver` on Windows, MacOS and Linux. It comes both as a Rust library as
well as a CLI for usage in non-Rust environments.

## Reflections

Two really important things happened for the Clippy team this month:

* We now have a [Roadmap for 2021](https://github.com/rust-lang/rust-clippy/blob/master/doc/roadmap-2021.md) 🎉
* We started doing bi-weekly meetings [on Zulip](https://rust-lang.zulipchat.com/#narrow/stream/257328-clippy/topic/Meeting.202021-01-26)

I believe this is going to be great for long-term contributor retention and
finding more team members. The bi-weekly meetings may also improve my personal
motivation to get things done.

As mentioned in my [previous post][december-review-2020], I'm now back in the
reviewer rotation for Clippy. To be honest, I don't have a good system for
managing review notifications, yet. So far I only decided that I will take a
month off from reviewing and open source once every year.

One thing that didn't go so well, is the implementation of the internal `cargo
dev bless` command that I rewrote in Rust in December. I came to the conclusion
that the way I implemented it was not the best way. The details can be found in
[this comment][cargo_dev_bless_comment]. Instead of keeping the current
implementation, I am helping out with implementing it the proper way in
`compiletest-rs`.

## Goals

* I want to help with the [re-implementation][cargo_dev_bless_comment] of `cargo dev bless`
* Push [webdriver-install] to a point where I can publicly announce a release
* Fixing more Clippy bugs
* Get a freelancing registration

<!-- begin links sponsor section-->
[thanks page]: https://phansch.net/thanks/
[Patreon]: https://www.patreon.com/philhansch
[embark]: https://github.com/EmbarkStudios
[@oli-obk]: https://github.com/oli-obk
[@yaahc]: https://github.com/yaahc
[@repi]: https://github.com/repi
<!-- end links sponsor section -->

<!-- begin links post -->
[december-review-2020]: https://phansch.net/posts/monthly-review-december-2020/
[reviewed]: https://github.com/rust-lang/rust-clippy/pulls?q=is%3Apr+sort%3Aupdated-desc+is%3Amerged+Approved+by%3A+phansch+merged%3A2021-01-01..2021-01-31+
[webdriver-install]: https://github.com/phansch/webdriver-install
[cargo_dev_bless_comment]: https://github.com/rust-lang/rust-clippy/issues/5394#issuecomment-767694586
<!-- end links post -->
