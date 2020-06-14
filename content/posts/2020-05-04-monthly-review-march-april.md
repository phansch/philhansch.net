+++
template = "post.html"
title = "Monthly review: March and April"
tags = ["monthly-review"]
aliases = ["2020/05/04/monthly-review-march-april/"]

[extra]
excerpt = "Pandemic procrastination."
+++

## Sponsors

I'm incredibly thankful to the following people for sponsoring my open source
work this past month: [@repi], [@oli-obk] and [@yaahc].

If you like what I'm doing and want to support my work, please consider
sponsoring me on [Patreon][patreon] or [via other
means](https://phansch.net/thanks) 💚

## What I've worked on

You might have noticed that the review for March is missing. This was mostly a result of the still ongoing pandemic. I started working from home mid-March and it took me a
few weeks to adjust. The following is what I've worked on in March and April
combined:

* Clippy: [Improved output of `large_enum_variant` lint][large_enum_variant]
* Clippy: [More usage of or patterns feature][or-patterns]
* Clippy: [Removal of `matches` dependency][matches]
* Clippy: [More usage of diagnostic items][diagnostic-items]
* Clippy: [Changelog for Rust 1.44][changelog]
* Clippy: More code cleanups: [one], [two] and [three]
* Tide/http-types: [Added various byte conversion methods][tide]

I've also been trying to review more of the incoming pull requests which, at least for me, takes a lot of energy. Currently that's around 15 minutes per day and one 1 hour timeslot per week for bigger PRs.

## Reflections

As mentioned above, I started working from home in March when the virus started
to become an issue here. At the beginning I had a lot of trouble concentrating
and getting a new daily routine in place. Things really only started getting better in April.

Towards the end of April I also decided to ditch touch typing with `dvorak`
(after using it for 6 years) and learn touch typing on `qwerty` instead. This
is currently slowing me down a lot:

[![qwerty stats](/assets/images/posts/2020/qwerty.png)](/assets/images/posts/2020/qwerty.png)

It's also incredibly frustrating because my brain slips back into `dvorak` every time
I'm not 100% focused. Once I'm faster, I want to write about this switch a
bit more.

## Goals

My primary goal for May is to reach 60+ WPM touch typing on `qwerty`. Another
thing I want to work on is adding indicators to [Clippy's lint
documentation][lint-docs]
that highlight which lints can be automatically fixed using `cargo fix
--clippy` ([#4310]).

<!-- begin links sponsor section -->
[thanks page]: https://phansch.net/thanks/
[Patreon]: https://www.patreon.com/philhansch
[@oli-obk]: https://github.com/oli-obk
[@yaahc]: https://github.com/yaahc
[@repi]: https://github.com/repi
<!-- begin links sponsor section -->

<!-- begin links post -->
[/etc/hosts]: https://phansch.net/2020/03/03/fighting-procrastination-part-1/
[or-patterns]: https://github.com/rust-lang/rust-clippy/pull/5322
[matches]: https://github.com/rust-lang/rust-clippy/pull/5370
[diagnostic-items]: https://github.com/rust-lang/rust-clippy/pull/5509
[tide]: https://github.com/http-rs/http-types/pull/100
[One]: https://github.com/rust-lang/rust-clippy/pull/5452
[Two]: https://github.com/rust-lang/rust-clippy/pull/5458
[Three]: https://github.com/rust-lang/rust-clippy/pull/5457
[large_enum_variant]: https://github.com/rust-lang/rust-clippy/pull/5466
[changelog]: https://github.com/rust-lang/rust-clippy/pull/5498
[lint-docs]: https://rust-lang.github.io/rust-clippy/master/index.html
[#4310]: https://github.com/rust-lang/rust-clippy/issues/4310
<!-- begin links post -->
