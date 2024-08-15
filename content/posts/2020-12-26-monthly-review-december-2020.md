+++
template = "post.html"
title = "Monthly review: December"
tags = ["monthly-review"]

[extra]
excerpt = "Embark Studios sponsorship and lockdown productivity."
+++

## Sponsors

I'm really excited about December's new bronze sponsor:

[Embark Studios][embark] 🎉

They have been supporting all kinds of open source Rust contributors this past
year and are a huge boon to the Rust community. I'm exited to work with them to
bring more Clippy features on the way!

I also want to thank the following people for continued sponsorship of my open
source work this past month: [@repi], [@oli-obk] and [@yaahc].

If you like what I'm doing and want to support my work as well, please consider
sponsoring me on [Patreon][patreon] or [via other
means](@/thanks/index.md) 🧡

## What I've worked on

4 code contributions got merged this month:

* [Rewrite update-all-references bash scripts in Rust](https://github.com/rust-lang/rust-clippy/pull/6413)
* [Separate suspicious_else_formatting tests](https://github.com/rust-lang/rust-clippy/pull/6473)
* [Fix blessing of new reference files](https://github.com/rust-lang/rust-clippy/pull/6471)
* [Don't trigger large_enum_variant in external macros](https://github.com/rust-lang/rust-clippy/pull/6485)

I've reviewed and approved [2 pull requests][reviewed].

Of those, the most rewarding work was rewriting Clippy's internal
'update-reference' scripts. These scripts are used by contributors to update the
reference files when test output has changed. Rewriting the scripts in Rust
should make contributing from Windows much easier.

## Reflections

Working from home during the lockdowns really messed with my daily routines and
habits. Now that there is hope for an end to the pandemic I have been able to
fix my lack of motivation that plagued me in the past months. I didn't get a lot
done from July to November. Outside of work I didn't have the energy to touch
any more code at all.

<div style="text-align: center">
  <a href="/assets/images/posts/2020/github-timeline-2020.png">
    <img src="/assets/images/posts/2020/github-timeline-2020.png" alt="screenshot" />
  </a>
</div>

In October I also [removed myself from the reviewer rotation][rmrf] for Clippy
and handed my pending reviews to the other members of the team. In retrospect, I
should have done that much earlier. This break from open source was something I
really needed and I won't hesitate to do this again in the future.

## Goals

My primary goal for January is to make Clippy's UI test blessing work from the
[rustc subtree checkout]. I have a working prototype locally but as I have not much
experience with the rustc tooling, I expect some edge cases will be uncovered
once my code is being reviewed.

This work will enable rustc contributors to update the Clippy UI test reference
files without any issues and with their familiar tooling.

Apart from that I'm going to re-add myself to the reviewer rotation for Clippy
and start reviewing larger pull requests again.

<!-- begin links sponsor section-->
[thanks page]: @/thanks/index.md
[Patreon]: https://www.patreon.com/philhansch
[embark]: https://github.com/EmbarkStudios
[@oli-obk]: https://github.com/oli-obk
[@yaahc]: https://github.com/yaahc
[@repi]: https://github.com/repi
<!-- end links sponsor section -->

<!-- begin links post -->
[rustc subtree checkout]: https://github.com/rust-lang/rust/tree/master/src/tools/clippy
[rmrf]: https://github.com/rust-lang/highfive/pull/295
[reviewed]: https://github.com/rust-lang/rust-clippy/pulls?q=is%3Apr+sort%3Aupdated-desc+is%3Amerged+Approved+by%3A+phansch+merged%3A2020-12-01..2020-12-31+
<!-- end links post -->
