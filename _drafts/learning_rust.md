Why Rust
- knowledge I can potentially apply at the job
- covers many new concepts
  - Didn't work with a statically typed language for more than 3 years

How so far
- advent of code
  - was a bit tough on the time constraints, but fun in the beginning
- exercism
  - about 50% done with all the exercises
  - has a heavy focus on mathematical problems and algorithms, therefore good for learning about iterators and basic collections

What I'm focusing on next
- still have almost no experience with
  - using traits
  - more lifetimes (understand the concept, but not really when to apply)
  - macros

What I found was missing from docs,etc.
- rustbyexample: Examples with methods


Proper clippy integration with build tools


# My first rust contribution

https://github.com/rust-lang/rust/issues/48103

Figured that it is a small isolated part of the code that should be somewhat easy to change.
It gives me the opportunity to set up rustlang on my machine without having to worry about too many things. I think building rust from source is not easy and I heard it takes some time, so I need to research first how to approach it.
I have some experience with lint writing.

Contributing.md is really good, but does not help me with my specific issue. What do I need to do in order to execute a lint test? (Specifically `test/compile-fail/lint-non_uppercase-statics.rs`)

One thing seems to be that there are no stderr files like in rust-clippy?
What are compile-fail tests then?
- stderr files are only used with ui tests, not with compile-fail tests.
- compile-fail tests are tests that are expected to fail compilation
Here is my approach:

1. Create a new ui test for the globals lint
   - Test statics
   - Test const
   - Probably add new test in test/ui/lint directory
   - Or maybe it is possible to change the annotations in `test/compile-fail/lint-non-uppercase-statics.rs`
     - How do the annotations work?
     - Looked at another test file for an example
     - TODO: Why is the .stderr content not including the new variable?
     - How to print debug information? I enabled debug-assertions but there is nothing yet?
3. Run the tests with RUST_BACKTRACE=1 ./x.py test --stage 1 src/test/ui
4. Fix the issue
