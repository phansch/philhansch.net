---
layout: post
title: "Monthly review: November"
excerpt: "Vacations and Clippy improvements."
tags:
  - monthly-review
aliases: ["2019/12/02/monthly-review-november/"]
---

## New Sponsors

Thanks to [@oli-obk] and [@yaahc], for their continuous support!

There haven't been any new sponsors this month. If you want to support my work,
please [consider sponsoring](https://phansch.net/thanks) :heart:

## What I've worked on

This past November I've been on vacation for two weeks, both of which required
some sort of preparation the days before. Therefore my main goal for November
was getting just two PRs merged:

1. [Fixing a false positive in `derive_hash_xor_eq`](https://github.com/rust-lang/rust-clippy/pull/4766)
2. [Adding a custom ICE message](https://github.com/rust-lang/rust-clippy/pull/4588)

The first one is just a simple bug fix. The second one means that Clippy will
point to the Clippy issues if there's a crash happening in Clippy. This
hopefully prevents Clippy issue reports in the rust repo in the future.

## Reflections & Goals for December

**This December** I want to try and put more structure into my learning. While
it's fun and rewarding to fix Clippy bugs, I'm slowly coming to the realization
that it's not necessarily a good way to learn more about Rust or rustc.

To put down some precise goals:

* I want to finish [my fork][fork] of [the-super-tiny-compiler][upstream]
  written in Rust to help my understanding of compilers.
* I want to try and review some of the open Clippy PRs  
  (there's been a lot of activity :tada:).
* I want to create more flashcards with the things I'm learning. I've been
  hovering at 50+ cards, but I want to double that this month.

See you here for the December review!

[fork]: https://github.com/phansch/the-super-tiny-compiler-in-rust
[upstream]: https://github.com/jamiebuilds/the-super-tiny-compiler
[sponsorship profile]: https://github.com/sponsors/phansch
[paypal.me profile]: https://www.paypal.me/philhansch
[@oli-obk]: https://github.com/oli-obk
[@yaahc]: https://github.com/yaahc
