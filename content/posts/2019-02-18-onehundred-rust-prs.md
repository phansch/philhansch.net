+++
template = "post.html"
title = "One Hundred Rust PRs later"
aliases = ["2019/02/18/onehundred-rust-prs/"]

[extra]
excerpt = "A review of my past year with Rust."
+++

It's hard for me to believe but it's already been **over a year** since I
seriously committed to learning Rust and I have now reached my initial goal of
100 open source contributions to the Rust ecosystem. You can see the full list
[here](@/onehundred/rust.md).

{{ timeline_progressbar(language="Rust") }}

I want to use this blog post to review the work I've done, talk about
the challenges I've come across and how I've tried to deal with them. I'm afraid
I haven't blogged in a long time and this is a bit longer than usual.

# Clippy!

I decided to work on Clippy for a couple of reasons:

* I love helping people and Clippy is the perfect force multiplier for that
* It's quick to iterate on bug fixes and new lints - Running the UI test suite
  takes only 1 minute on my machine
* It had a lot of reach, with at the time ~2000 GH stars (now at 3000+)
* Clippy had (and still has) the [good first issue][gfi] label that made finding
tasks super easy
* The other contributors were super responsive and helpful
* As a jumping point towards more advanced rustc internals

I had done some small documentation contributions and was watching other people
contribute new lints and such. With the beginning of 2018 I decided to focus
on Rust in my free time as much as possible. It was also a sort of experiment on
whether I had the grit to stay with a longer-term project.

## January to March

At the beginning of January 2018, my first big Clippy contribution was [a
Lint][2340] that detects empty lines after outer attributes, such as:

```rust
#[deny(missing_docs)]

fn something_to_document() { ... }
fn more_to_document() { ... }
```

The rationale for this lint is that the attribute was *probably* meant to be an
inner attribute because it has empty lines that follow. In the process of
writing that lint I learned that there are a *lot* of things to consider when
linting Rust code and the lint resulted in a few false-positives that I also
fixed.

I think this experience made me aware of how much potential for improvements
there is in Clippy and I decided to spend more time on bug fixing than adding
new lints from then on.

## April to June

To prevent Clippy crashing on essential ecosystem crates, I [added an
integration test suite to Clippy][2764] that makes sure Clippy doesn't crash
when it's executed on them.

In May I [expanded the existing build script][2733] to include a check that ensures
a recent nightly release is used to build Clippy. As of now, this has been
removed again because Clippy is now distributed via [Rustup][rustup].

## July to November

From August to November 2018 I rewrote a 300 line python script in Rust to make
it work cross-platform: [#2985][2985], [#3320][3320], [#3325][3325],
[#3327][3327], [#3388][3388], [#3399][3399], [#3408][3408].  
If you've contributed a Clippy lint before,
chances are that you've used one of these versions. The rewrite is probably
worth its own blog post at some point.


## December to February 2019

In December I [added Rustfix support to the compiletest-rs
library][rustfix_compiletest], which in turn [allows Clippy][3519] to test its
code suggestions. This will prevent suggestion regressions, improve future
suggestions and help pave the path to a reliable Clippy ⟺ Rustfix integration.
This is an ongoing effort and if you want to help out with this, there is an
open [tracking issue][rustfix_tracking] with some instructions.

In January 2019 I [added a lint][3648] that detects whether a function can be `const` or
not. This lint is currently in the `nursery` group as the `const_fn` feature is
not fully stabilized yet. You can give it a try by using
`#![warn(clippy::missing_const_for_fn)]` if you are on beta or nightly.

## Other contributions

* Not going into further detail, I also [fixed about 20 bugs and crashes][bugs]
  in Clippy over this time. Of those, [this one][yay] is probably my favorite
  fix. I also [wrote a blog post][my_post] about one of them.
* I [added][hubcaps_pr] the ability to create GitHub review comments to [hubcaps][hubcaps]
* I [made the tests][compiletesttest] of rustc's `compiletest` runnable via `./x.py`

# Did it work?

I specifically started this project to improve my grit for longer-term projects
and I would say that it worked. Together with other things, working on Clippy
helped me to increase my focus to stick through harder tasks.

Working on crashes where I know next to nothing in the beginning is *really*
hard motivation wise. In one case it has caused me to step away for a couple of
weeks. This is something that I want to still work on.

I also want to solidify more fundamentals. When I go to the Rust Berlin learners
meetup I sometimes feel like I can't explain some things properly. I suppose one
problem of fixing bugs in Clippy is that there's not a lot of general Rust
knowledge to learn. It's more about very specific rustc or Clippy internals.

# What's next?

For the reasons mentioned at the beginning, I will absolutely continue working
on Clippy and focus on improving its reliability. I am currently reworking the
contribution guidelines to lower the bar of entry for new contributors and then
want to get back to fixing bugs and crashes.

However, I also want to improve my fundamentals. To do that, I'm expanding my
Anki card collection to be able to recall more from memory and going through
TRPL a second time.

On to the next hundred contributions!

[2340]: https://github.com/rust-lang/rust-clippy/pull/2340
[2733]: https://github.com/rust-lang/rust-clippy/pull/2733
[2764]: https://github.com/rust-lang/rust-clippy/pull/2764
[2985]: https://github.com/rust-lang/rust-clippy/pull/2985
[3320]: https://github.com/rust-lang/rust-clippy/pull/3320
[3325]: https://github.com/rust-lang/rust-clippy/pull/3325
[3327]: https://github.com/rust-lang/rust-clippy/pull/3327
[3388]: https://github.com/rust-lang/rust-clippy/pull/3388
[3399]: https://github.com/rust-lang/rust-clippy/pull/3399
[3408]: https://github.com/rust-lang/rust-clippy/pull/3408
[3519]: https://github.com/rust-lang/rust-clippy/pull/3519
[3648]: https://github.com/rust-lang/rust-clippy/pull/3648
[gfi]: https://github.com/rust-lang/rust-clippy/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc+label%3A%22good+first+issue%22
[rustfix_compiletest]: https://github.com/laumann/compiletest-rs/pull/151
[rustfix_tracking]: https://github.com/rust-lang/rust-clippy/issues/3630
[rustup]: https://rustup.rs/
[bugs]: https://github.com/rust-lang/rust-clippy/pulls?utf8=%E2%9C%93&q=is%3Apr+sort%3Aupdated-desc+author%3Aphansch+is%3Aclosed+Fix+in%3Atitle
[hubcaps]: https://github.com/softprops/hubcaps
[hubcaps_pr]: https://github.com/softprops/hubcaps/pull/142
[yay]: https://github.com/rust-lang/rust-clippy/pull/2763
[compiletesttest]: https://github.com/rust-lang/rust/pull/56792
[my_post]: @/posts/2018-10-10-fixing-a-clippy-crash.md
