---
layout: post
title: "Monthly review: February"
excerpt: "Improving diagnostics and fighting impostor syndrome."
tags:
  - monthly-review
aliases: ["2020/03/03/monthly-review-february/"]
---

## Sponsors

I'm incredibly thankful to the following people for sponsoring my open source
work this past month: [@repi], [@oli-obk] and [@yaahc].

If you like what I'm doing and want to support my work, please consider
sponsoring me on [Patreon][patreon] or [via other
means](https://phansch.net/thanks) :heart:

## What I've worked on

February has been quite a non-productive month from the outside. Maybe it's the
winter blues finally catching up to me, but that's for the next section of the
post.

It indeed doesn't look like a lot in terms of merged PRs this month. The only
merged PR is to the `rustc-guide` where I've added an [introductory
section][rustc_guide_pr] to the _Name Resolution_ chapter.

I've been learning about name resolution in rustc because I've been looking into
making some improvements to a rustc diagnostic that is emitted exactly during
name resolution. So that instead of this:

{% highlight rust %}
12 |  let _ = HashNap::new();
   |          ^^^^^^^
   |          |
   |          use of undeclared type or module `HashNap`
{% endhighlight %}

You will get an additional suggestion of the most likely alternative:


{% highlight rust %}
12 |  let _ = HashNap::new();
   |          ^^^^^^^
   |          |
   |          use of undeclared type or module `HashNap`
   |          help: a struct with a similar name exists: `HashMap`
{% endhighlight %}

This PR has taken most of my time and energy in February. I want to finish it
this month and continue with work around name resolution.

## Reflections

I did not get further into embedded development as I ran into issues with my
tools, which I was hoping to avoid by jumping into embedded development.

Instead of doing more embedded development, I've started looking into
`librustc_resolve`. Specifically [a PR to improve some diagnostics][resolve_pr]
as mentioned above.  This PR has apparently triggered some sort of impostor
feeling in me. While working on this PR I noticed two things:

1. In the beginning I had absolutely no idea what `librustc_resolve` is about,
   lowering my confidence in completing this PR
2. My low confidence in completing the PR also produced feelings of guilt when
   asking otherwise busy contributors for help

In the future I hope this feeling will go away as I dig further into rustc.
Until then, I plan to 'just' push through these feelings, keeping my main goal
in the back of my head: Making diagnostics and lints better for rust users.

## Goals

For this March I have the following goals:

* Finishing up [the mentioned PR][resolve_pr]
* Further improving the name resolution chapter of the rustc-guide
* Potentially do more work around `librustc_resolve` diagnostics

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
[resolve_pr]: https://github.com/rust-lang/rust/pull/68850
[Patreon]: https://www.patreon.com/philhansch
[rustc_guide_pr]: https://github.com/rust-lang/rustc-guide/pull/590/files#diff-334e46ef0ebca8ba3936db3ac8ae0d7dR3
