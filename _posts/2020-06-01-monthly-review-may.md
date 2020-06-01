---
layout: post
title: "Monthly review: May"
excerpt: "Touch typing and reviewing more pull requests."
tags:
  - monthly-review
---

## Sponsors

I'm incredibly thankful to the following people for sponsoring my open source
work this past month: [@repi], [@oli-obk] and [@yaahc].

If you like what I'm doing and want to support my work, please consider
sponsoring me on [Patreon][patreon] or [via other
means](https://phansch.net/thanks) :heart:

## What I've worked on

One code contribution got merged this month:

* [Fix a false positive in `empty_line_after_outer_attr` lint][#5609]

I've reviewed and approved [22 pull requests][reviewed].

## Reflections

### Reviewing pull requests

Since Clippy is now using [rust-highfive], incoming pull requests are
automatically assigned to people on the reviewer list. Something about the random
assignment makes a big difference to me. I feel so much more motivated to review
pull requests. [@flip1995] also did a lot of PR triage and we're down to [~20 open
PRs][prs] from around 40 at the beginning of May.

This makes me think that I should prioritize reviewing pull request more. It
brings in more contributors and team additions in the long run which means more
people are going to be in the reviewer pool.

### `qwerty` touch typing

I almost achieved my primary goal from [last month]: Reaching 60+ WPM touch typing
on `qwerty`. Currently I'm hovering around 50 WPM. This graph shows my progress
on [10fastfingers.com] starting with the 10th of May:

<a href="/assets/images/posts/2020/wpm.png" class="thumbnail">
  <img src="/assets/images/posts/2020/wpm.png" alt="screenshot" width="250" />
</a>

I'm still not where I want to be, especially when it comes to my `vim` muscle
memory that I had to give up. While I'm typing with `qwerty` these days, I also
want to be more mindful about potential finger pain and RSI because `dvorak`
felt much more comfortable to me.

## Goals

My primary goal for June is to reach 80+ WPM touch typing on `qwerty`. I feel as
if I can't get into proper flow without being able to touch type properly. 

Apart from that I want to try and prioritize my assigned Clippy pull request
reviews over providing my own code contributions.

{% comment %} begin links sponsor section {% endcomment %}
[thanks page]: https://phansch.net/thanks/
[Patreon]: https://www.patreon.com/philhansch
[@oli-obk]: https://github.com/oli-obk
[@yaahc]: https://github.com/yaahc
[@repi]: https://github.com/repi
{% comment %} begin links sponsor section {% endcomment %}

{% comment %} begin links post {% endcomment %}
[10fastfingers.com]: https://10fastfingers.com/user/2094488/
[last month]: /2020/05/04/monthly-review-march-april/
[prs]: https://github.com/rust-lang/rust-clippy/pulls?q=is%3Apr+is%3Aopen+sort%3Aupdated-desc
[@flip1995]: https://github.com/flip1995
[rust-highfive]: https://github.com/rust-lang/highfive
[#5609]: https://github.com/rust-lang/rust-clippy/pull/5609
[reviewed]: https://github.com/rust-lang/rust-clippy/pulls?q=is%3Apr+sort%3Aupdated-desc+is%3Amerged+Approved+by%3A+phansch+merged%3A2020-05-01..2020-06-01+
{% comment %} begin links post {% endcomment %}
