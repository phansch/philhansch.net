+++
template = "post.html"
title = "Accepting sponsorship"
aliases = ["2019/10/21/sponsoring/"]

[extra]
excerpt = "You can sponsor my open source work now."
+++

I have just set up a [sponsorship profile][profile] on GitHub 🎉

The past two years I have been working on Clippy in my free time, sometimes
before and sometimes after my full-time programming job. To date I have
[contributed over 200 pull requests][onehundred] to Clippy, Rust and other Rust related
projects. If you feel like my work is worth supporting, you now have the option
to do so!

Some of my past contribution highlights include:

* [Fixing of multiple crashes in Clippy][crashfix]
* [Adding rustfix support for the Clippy testsuite][rustfix]
* [Rewriting a Clippy python developer script in Rust][riir]
* [Adding](https://github.com/rust-lang/rust-clippy/pull/3824) the initial
  version of the [lint writing documentation][lintdoc] for Clippy
* The [missing_const_for_fn][missing_const_for_fn] lint

At the time of this writing, I'm working on:

* Slowly [replacing Rust's diagnostics emitter][emitter-rewrite], the code that formats Rust's awesome error
  messages
* [Adding a custom ICE message to Clippy][clippy_ice_message]

You can always check what I'm currently working on, [in this GitHub project][rust-project].

## What about rewards?

I've set the bar for rewards high. I only have limited time every day to work on
open source and want to spend that time on the Rust things I'm passionate about.
This makes sure I'm motivated for the tasks I choose to work on.

To keep my work sustainable, I make **one** commitment for now: I will
post **monthly reviews** publicly here on the blog. These reviews will include:

* A special shout-out to new sponsors (unless you don't want to be
  mentioned)
* Review of what I've worked on during the past month
* Goals for the next month
* Reflections on my work, productivity and motivation for the past month
* As I'm freeing up more time to work on open-source based on sponsorships,
  there will be more things coming in the future, for sure


<div style="text-align:center">
  {{ sponsorbadge_github() }} {{ sponsorbadge_patreon() }} {{ sponsorbadge_paypal() }}
</div>

If you have any questions or feedback, I'm happy to talk on Twitter or in
private at [dev@phansch.net](mailto:dev@phansch.net).

[profile]: https://github.com/users/phansch/sponsorship
[onehundred]: /onehundred/rust/
[crashfix]: https://github.com/rust-lang/rust-clippy/pulls?utf8=%E2%9C%93&q=is%3Apr+sort%3Aupdated-desc+%27Fix+ICE%27+is%3Aclosed+author%3Aphansch+
[riir]: https://github.com/rust-lang/rust-clippy/pulls?utf8=%E2%9C%93&q=is%3Apr+sort%3Aupdated-desc+RIIR+is%3Aclosed+author%3Aphansch+
[rustfix]: https://github.com/rust-lang/rust-clippy/pull/3519
[lintdoc]: https://github.com/rust-lang/rust-clippy/blob/master/doc/adding_lints.md
[missing_const_for_fn]: https://rust-lang.github.io/rust-clippy/master/index.html#missing_const_for_fn
[rust-project]: https://github.com/users/phansch/projects/3
[emitter-rewrite]: https://github.com/rust-lang/rust/issues/59346
[clippy_ice_message]: https://github.com/rust-lang/rust-clippy/pull/4588
