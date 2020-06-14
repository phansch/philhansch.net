+++
template = "post.html"
title = "From Ruby to Rust"
aliases = ["2018/04/08/from-ruby-to-learning-rust/"]

[extra]
excerpt = "Learning Rust to dive deeper."
+++

It's been a few months since I've written here and it's time for an update.

The idea to learn another programming language than Ruby was on my mind the majority of 2017.
I know Ruby pretty well and have been doing it for over 4 years now, and I feel like my learning has slowed down a lot in the past year.

Last November, after playing around with Elixir, I decided that it would be better to learn Rust if I want to learn things more deeply.

I really think Elixir and Erlang have their place and I enjoyed doing Elixir. However, the reach of Elixir and Erlang doesn't seem to go far beyond web development and communication technology. Furthermore, I felt like being on the same abstraction level as Ruby where I didn't learn as deeply as I could.

That's why I decided to focus on [**Rust**](https://rust-lang.org) this year.

Rust gives me much more freedom but it still allows me to build sensible abstractions that keep me productive.
The language itself covers many new concepts that I didn't have to deal with in Ruby. Especially the type system and borrow checker.

#### How am I learning Rust

At the beginning of December I started with [Advent of Code](https://github.com/phansch/aoc). It was fun, but AoC was a bit tough with time constraints and the fact that I never really did Rust before, contributed to me giving up. After partly finishing the first week I decided not to continue.

Instead, I started with the [Exercism exercises](http://exercism.io/languages/rust/exercises) for Rust. Currently I'm about halfway done with all the exercises.
Almost all of them have a focus on mathematical problems and algorithms, which makes them perfect for learning about iterators and collections.

While doing these practice exercises can be fun, I was also looking to contribute something useful to the community and getting my hands on some real-world Rust code.

#### Clippy

I don't remember exactly how I found it, but I have now been contributing for about 2 months: [Clippy](https://github.com/rust-lang-nursery/rust-clippy).

Clippy is a bunch of lints that catch common mistakes and improve your Rust code.

Contributing to Clippy is awesome in many ways. It's an opportunity to teach users how to improve their Rust code while also preventing common mistakes at the same time.
For me as a contributor, Clippy allows me to learn Rust while also learning about Rust internals.

My first lint was [this one](https://github.com/rust-lang-nursery/rust-clippy/pull/2340). It turned out much more tricky in the end because attributes in Rust are not at all what they look like on the surface. There were a hand full of bug reports after it got merged.

Not being a Rust expert certainly made it more difficult, but it's totally possible to do a deep dive into a very specific area of Rust internals and coming out alive.

I am also regularly going to the Berlin Rust Hackers/Learners Meetup and the last time it happened during the [Rust All Hands 2018](https://blog.rust-lang.org/2018/04/06/all-hands.html). The atmosphere that day was exciting to say the least. I got to meet some of the people working on Clippy and everyone was super welcoming.

The end result of that day was that I'm now part of the clippy team! While I wasn't super productive that day, I left with many ideas and lots of enthusiasm.

#### What's next

For Clippy I want to personally focus on fixing existing bugs and lowering the open PR count. I also want to improve the contribution instructions to make it easier for new people to contribute.

In order to do that I need to learn more Rust. I haven't finished my copy of 'Programming Rust' by Jim Blandy and Jason Orendorff, yet. Once finished, I want to get some practical experience writing my own thing from scratch.

I started a [GNU Typist](https://www.gnu.org/software/gtypist/index.html) rewrite last year but didn't continue because I didn't know enough Rust at the time: [rtypist](https://github.com/phansch/rtypist). I hope to pick it up again this month and use it to get some practical experience with traits, lifetimes and writing my own macros.
