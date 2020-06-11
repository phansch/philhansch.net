---
layout: "post"
title: "Fixing a Clippy crash"
excerpt: "Learning a lot about rustc internals."
aliases: ["2018/10/10/fixing-a-clippy-crash/"]
---

3 weeks ago I set out to fix a crash in Clippy, this is what I learned along the
way. I hope this blog post will be useful for other people diving
into Clippy and maybe serve as motivation if things get difficult.

* TOC
{:toc}

# Meet the crash

The crash has been reported in [this Clippy issue][clippy_issue].
It is demonstrated with the following valid Rust program:

```rust
trait Foo<'a, A> {}

impl<'b, T> Foo<'b, T> for T {}

fn func<'b, S: Foo<'b, ()>>(_item: S) {}

fn main() {}
```

When executed with rustc, it compiles, but it produces the following ICE when it
is executed with Clippy:

```rust
error: internal compiler error: librustc/ty/relate.rs:700: impossible case reached
thread 'main' panicked at 'Box<Any>', librustc_errors/lib.rs:554:9
stack backtrace:
<snip>
```

## Traits.. generics.. lifetimes!? Oh no

The crashing snippet from above shows why I have been.. not so quick with fixing
this. I have been avoiding dealing with explicit lifetime annotations since I
started with Rust almost a year ago. Further, I have never been in a position
where it made sense to implement my own traits, especially not generic traits,
so it was pretty easy to avoid.

It's safe to say that, at this point, I don't really understand what this
program means. Let's figure it out step by step.


```rust
trait Foo<'a, A> {}
```

This is a trait called `Foo` with no associated items. `Foo` is also generic
over any type `A` and it declares a lifetime parameter `'a`. By itself, this
does not mean anything, but it allows for potential implementors of this trait
to use the lifetime `'a` and the generic type `A`.

```rust
impl<'b, T> Foo<'b, T> for T {}
```

Here we define an implementation of our trait `Foo` for any type `T`. Again, we
declare a lifetime `'b` and a generic type `T` so that we can use them to implement
`Foo`. This `impl` also declares no associated items.


```rust
// func takes item of type S which has to implement `Foo`
fn func<'b>(_item: impl Foo<'b, ()>) {}
```

The last line contains the cause of the Clippy crash. Again we declare that the
function is going to use a lifetime `'b`. We then define a parameter that can
be any type that implements `Foo` with the lifetime of `'b` and a type of `()`.

## The backtrace

The backtrace contains some first pointers where we can have a further look.

```rust
error: internal compiler error: librustc/ty/relate.rs:705: impossible case reached

thread 'main' panicked at 'Box<Any>', librustc_errors/lib.rs:599:9
stack backtrace:
  // snip
  13: rustc::util::bug::bug_fmt
  14: <rustc::ty::subst::Kind<'tcx> as rustc::ty::relate::Relate<'tcx>>::relate
  15: <&'a mut I as core::iter::iterator::Iterator>::next
  16: <smallvec::SmallVec<A> as core::iter::traits::FromIterator<<A as smallvec::Array>::Item>>
    ::from_iter
  17: <core::result::Result<T, E> as rustc::ty::context::InternIteratorElement<T, R>>::intern_with
  18: <rustc::ty::sty::TraitRef<'tcx> as rustc::ty::relate::Relate<'tcx>>::relate
  19: rustc::infer::InferCtxt::commit_if_ok
  20: rustc::traits::select::SelectionContext::match_impl
  21: rustc::infer::InferCtxt::probe
  22: rustc::ty::trait_def::<impl rustc::ty::context::TyCtxt<'a, 'gcx, 'tcx>>::for_each_relevant_impl
  // snip
  34: rustc::ty::query::__query_compute::evaluate_obligation
  35: rustc::ty::query::<impl rustc::ty::query::config::QueryAccessors<'tcx> for
    rustc::ty::query::queries::evaluate_obligation<'tcx>>::compute
  36: rustc::dep_graph::graph::DepGraph::with_task_impl
  37: rustc::ty::context::tls::with_related_context
  38: rustc::ty::query::plumbing::<impl rustc::ty::context::TyCtxt<'a, 'gcx, 'tcx>>
    ::force_query_with_job
  39: rustc::ty::query::plumbing::<impl rustc::ty::context::TyCtxt<'a, 'gcx, 'tcx>>::get_query
  40: rustc::traits::query::evaluate_obligation::<impl rustc::infer::InferCtxt<'cx, 'gcx, 'tcx>>
    ::evaluate_obligation
  41: rustc::traits::query::evaluate_obligation::<impl rustc::infer::InferCtxt<'cx, 'gcx, 'tcx>>
    ::predicate_must_hold
  42: clippy_lints::utils::implements_trait::{{closure}}
             at clippy_lints/src/utils/mod.rs:258
  43: rustc::infer::InferCtxtBuilder::enter::{{closure}}
             at librustc/infer/mod.rs:472
  // snip
  56: clippy_lints::utils::implements_trait
             at clippy_lints/src/utils/mod.rs:258
  57: <clippy_lints::needless_pass_by_value::NeedlessPassByValue as rustc::lint::LateLintPass<'a, 'tcx>>
    ::check_fn::{{closure}}
             at clippy_lints/src/needless_pass_by_value.rs:178
  58: core::iter::iterator::Iterator::all::{{closure}}
             at libcore/iter/iterator.rs:1680
  59: core::iter::iterator::Iterator::try_for_each::{{closure}}
             at libcore/iter/iterator.rs:1559
  60: <core::slice::Iter<'a, T> as core::iter::iterator::Iterator>::try_fold
             at libcore/slice/mod.rs:2490
  61: core::iter::iterator::Iterator::try_for_each
             at libcore/iter/iterator.rs:1559
  62: core::iter::iterator::Iterator::all
             at libcore/iter/iterator.rs:1679
  63: <clippy_lints::needless_pass_by_value::NeedlessPassByValue as rustc::lint::LateLintPass<'a, 'tcx>>
    ::check_fn
             at clippy_lints/src/needless_pass_by_value.rs:175
```

Let's go through the backtrace from top to bottom.

```rust
error: internal compiler error: librustc/ty/relate.rs:705: impossible case reached
```

This tells us where the crash was reported from inside rustc. I'm noting this
down to have a look at the code later.

Next follow 30 to 40 lines of plumbing, like:

```rust
  39: rustc::ty::query::plumbing::<impl rustc::ty::context::TyCtxt<'a, 'gcx, 'tcx>>::get_query
```

For now, I think all these lines are irrelevant to the crash in Clippy.

Further down we find more useful information:

```rust
  56: clippy_lints::utils::implements_trait
             at clippy_lints/src/utils/mod.rs:258
  57: <clippy_lints::needless_pass_by_value::NeedlessPassByValue as rustc::lint::LateLintPass<'a, 'tcx>>
    ::check_fn::{{closure}}
             at clippy_lints/src/needless_pass_by_value.rs:178
```

This tells us from where Clippy invoked the chain of methods that caused the
Crash. In other words, one of these places is probably using rustc internals
incorrectly.

It also shows which lint caused the crash to happen.

`needless_pass_by_value` checks for functions that take arguments by value and
don't consume those arguments. Clippy should suggest to pass these arguments by
reference instead:

```rust
fn foo(v: Vec<i32>) {
    assert_eq!(v.len(), 42);
}

// should be:

fn foo(v: &[i32]) {
    assert_eq!(v.len(), 42);
}
```

And indeed, in our crashing example, we pass the argument by value:

```rust
fn func<'b, S: Bar<'b, ()>>(_item: S) {}
```

We are now sure that this code should trigger the `needless_pass_by_value` lint
but it crashes instead. Next, we are going to try and find out more about what's
going on internally.

## First steps to fixing a Clippy bug

The first thing we are going to do is making the crash easily reproducible by
creating a test case. Luckily someone [already provided][thanks] a minimal crashing
example in the issue. A minimized example is always *super* helpful.

We are going to add the code to the `run-pass` test suite of Clippy. The
`run-pass` suite will fail if any of the code inside fails to compile.

Here's our failing code:

```rust
// tests/run-pass/ice-2831.rs
#![allow(dead_code)]

trait Bar<'a, A> {}
impl<'b, T> Bar<'b, T> for T {}
fn funk<'b, S: Bar<'b, ()>>(_item: S) {}

fn main() {}
```

We can now run the test easily using:

```shell
RUST_BACKTRACE=1 TESTNAME=run-pass/ice-2831 cargo test --test compile-test
```

As expected, this fails to compile and crashes with the backtrace from above.
Good!

## Debugging with println!

Now that we are able to quickly run the test, we can start to debug the
crash. I usually use plain `println!` calls to get all the possibly relevant
values printed to stdout.

In this case we want to know what we pass through to rustc before
`predicate_must_hold` is called:

```rust
/// Check whether a type implements a trait.
/// See also `get_trait_def_id`.
pub fn implements_trait<'a, 'tcx>(
    cx: &LateContext<'a, 'tcx>,
    ty: Ty<'tcx>,
    trait_id: DefId,
    ty_params: &[Kind<'tcx>],
) -> bool {
    let ty = cx.tcx.erase_regions(&ty);
    let obligation = cx.tcx.predicate_for_trait_def(
        cx.param_env, traits::ObligationCause::dummy(), trait_id, 0, ty, ty_params
    );
    println!("cx.param_env: {:?}", cx.param_env);
    println!("ty: {:?}", ty);
    println!("obligation: {:?}", obligation);
    println!("ty_params: {:?}", ty_params);
    // NOTE: Crash happens after `predicate_must_hold` is called
    cx.tcx.infer_ctxt().enter(|infcx| infcx.predicate_must_hold(&obligation))
}
```

Using the command from above, this will recompile the changed code and execute
our test. Here is the result:

```rust
cx.param_env: ParamEnv { caller_bounds: [
    Binder(TraitPredicate(<S as Bar<'b, ()>>)), Binder(TraitPredicate(<S as std::marker::Sized>))
  ], reveal: UserFacing }
ty: &S
obligation: Obligation(predicate=Binder(TraitPredicate(<&S as Bar<()>>)),depth=0)
ty_params: [()]
```

# Understanding the context

Maybe you can spot something in the debug output already. However, I first want
to find out what all these new types mean.
I have dealt with `ParamEnv` before, but `Binder`, `TraitPredicate` and `Obligation` are new to me.
It looks like it's time to learn about some rustc internals. Nice!
Learning about rustc internals usually means searching around in the
[rustc-guide][rustc_guide] and in the [rust compiler documentation][rustc_docs]
and putting all the information together.

<div class="explain">
  <h2>ⓘ New concepts</h2>

  <h4>ParamEnv</h4>
  <blockquote>
  ParamEnv is short for Parameter Environment. It contains information about the
  trait bounds. It can be used to check whether a type implements a certain
  trait, for example.
  <br><br>
  <cite>
    Source: <a href="https://doc.rust-lang.org/nightly/nightly-rustc/rustc_middle/ty/struct.ParamEnv.html">rustc::ty::ParamEnv</a>
  </cite>
  </blockquote>

  <h4>Binder</h4>
  <blockquote>
  As I understand it, a `Binder` associates variables with arguments where they were defined. For
  example in the closure `|a, b| a + b`, the `a` and `b` in the `a + b ` are bound to the closure,
  and the closure signature `|a, b|` is a binder for the names `a` and
  `b`.<br>
  This also applies to lifetime parameters.
  <br><br>
  <cite>
    Sources:
    <ul>
      <li><a href="https://doc.rust-lang.org/nightly/nightly-rustc/rustc_middle/ty/struct.Binder.html">rustc::ty::Binder</a></li>
      <li><a href="https://rust-lang.github.io/rustc-guide/appendix/background.html#free-vs-bound">rustc-guide: Free vs. Bound regions</a></li>
      <li><a href="https://rust-lang.github.io/rustc-guide/appendix/glossary.html?highlight=binder#appendix-c-glossary">rustc-guide: Glossary</a></li>
    </ul>
  </cite>
  </blockquote>

  <h4>TraitPredicate</h4>
  <blockquote>
  A predicate related to traits. A predicate in the rust type system describes
  something about the given type. For example, whether it is well formed, object
  safe or a subtype with another type.
  As far as I understand it, a TraitPredicate is a predicate that says whether a
  type implements a given trait.
  <br><br>
  <cite>
    Source: <a href="https://rust-lang.github.io/rustc-guide/ty.html?highlight=predicate#beyond-types-other-kinds-of-arena-allocated-data-structures">rustc-guide: Ty</a>
  </cite>
  </blockquote>

  <h4>Obligation</h4>
  <blockquote>
  An Obligation represents some trait reference (e.g. int:Eq) for which the
  vtable must be found. The process of finding a vtable is called "resolving"
  the Obligation. This process consists of either identifying an impl (e.g.,
  impl Eq for int) that provides the required vtable, or else finding a bound
  that is in scope.
  <br><br>
  <cite>
    Source: <a href="https://doc.rust-lang.org/nightly/nightly-rustc/rustc_infer/traits/struct.Obligation.html">rustc_infer::traits::Obligation</a>
  </cite>
  </blockquote>

  <h4>vtable</h4>
  <blockquote>
  A vtable is a struct that contains the function pointers to the trait's
  associated functions. The pointers point directly to the concrete machine code
  for each method in the implementation.
  <br><br>
  <cite>
    Source: <a href="https://doc.rust-lang.org/nightly/nightly-rustc/rustc_infer/traits/enum.ImplSource.html">rustc::traits::vtable</a>
  </cite>
  </blockquote>
</div>

With all that in mind, let's review our debug output again:


```rust
cx.param_env: ParamEnv { caller_bounds: [
    Binder(TraitPredicate(<S as Bar<'b, ()>>)), Binder(TraitPredicate(<S as std::marker::Sized>))
  ], reveal: UserFacing }
ty: &S
obligation: Obligation(predicate=Binder(TraitPredicate(<&S as Bar<()>>)),depth=0)
ty_params: [()]
```

What's especially interesting about our debug output is that the `Obligation`
contains a `TraitPredicate` that is different to the `Obligation` in the
`ParamEnv`:

```rust
// Our self-built TraitPredicate:
TraitPredicate(<&S as Bar<()>>)

// The TraitPredicate in ParamEnv:
TraitPredicate(<S as Bar<'b, ()>>)
```

The reason for that is probably that we build the `Obligation` in the lint code
ourselves, while the `ParamEnv` is the one of the actual test case.

---
At this point I have been looking into this bug for more than two weeks in my
free time. I have to say thanks to [@arielb1][ariel] who pointed me in the [right
direction][ariel_comment] after I [improved the output][rustc_issue] of this ICE in rust.

---

# Fixing the bug

@arielb1 [confirmed my suspicion][ariel_comment]: The `TraitPredicate` in the
Obligation should contain the lifetime, too:

> It calls `input_types`, which drops the lifetime parameters out of `Bar`,
> turning an OK `<S as Bar<'b, ()>>` trait-ref into a not-OK `<&S as Bar<()>>`
> trait ref. The not OK trait-ref has its indexes wrong because it's missing a
> lifetime - at index 0, it should have a lifetime, not a type. So you get an
> ICE.

With that information, the fix was only a few hours away and turned out as a 9
line change:

```diff
diff --git a/clippy_lints/src/needless_pass_by_value.rs b/clippy_lints/src/needless_pass_by_value.rs
index 980e2c28a..73d59d7a3 100644
--- a/clippy_lints/src/needless_pass_by_value.rs
+++ b/clippy_lints/src/needless_pass_by_value.rs
@@ -174,15 +174,14 @@ impl<'a, 'tcx> LateLintPass<'a, 'tcx> for NeedlessPassByValue {
                 (
                     preds.iter().any(|t| t.def_id() == borrow_trait),
                     !preds.is_empty() && preds.iter().all(|t| {
+                        let ty_params = &t.skip_binder().trait_ref.substs.iter().skip(1)
+                            .cloned()
+                            .collect::<Vec<_>>();
                         implements_trait(
                             cx,
                             cx.tcx.mk_imm_ref(&RegionKind::ReErased, ty),
                             t.def_id(),
-                            &t.skip_binder()
-                                .input_types()
-                                .skip(1)
-                                .map(|ty| ty.into())
-                                .collect::<Vec<_>>(),
+                            ty_params
                         )
                     }),
                 )
```

You may wonder how this is fixing the issue exactly. We first removed the
[input_types()][input_types] call. This means we have to find a replacement to
get the collection of lifetimes and type parameters for the given trait
reference `t`.

Let's have a look at the source of `input_types()` and see how it gets the type
parameters of the trait reference:

```rust
pub fn input_types<'a>(&'a self) -> impl DoubleEndedIterator<Item=Ty<'tcx>> + 'a {
    // Select only the "input types" from a trait-reference. For
    // now this is all the types that appear in the
    // trait-reference, but it should eventually exclude
    // associated types.
    self.substs.types()
}
```

[Substs][substs] is what we're looking for. It contains the different parameters
of the type, including lifetimes. For example the `substs` of a `HashMap<i32,
i32>` would more or less look like this: `&[tcx.types.i32, tcx.types.i32]`.

In our example, `S: Foo<'b, ()>`, that would be `[S, ReEarlyBound(0, 'b), ()]`.
The first element is the name of the type parameter, `S`. The second one is the
name of the lifetime, `'b`. The last one is unit.

Calling `substs.types()` on `S: Foo<'b, ()>` will result in `[()]`. However,
using `substs` directly, gives us what we want: `[S, ReEarlyBound(0, 'b), ()]`.
Instead of calling `types()` on substs, we just iterate over the `substs`
directly and avoid the crash.

With the crash fixed, this concludes the post. I hope you were able to learn
something new from this. Maybe I also inspired you to have a go at working on
Clippy. If that's the case I encourage you to look through the [good first
issue][gfi] label, pick one that seems easy to you and dig in =)

You can find the final PR [here][clippy_pr].

[compiler_plugin]: https://doc.rust-lang.org/unstable-book/language-features/plugin.html#lint-plugins
[clippy_issue]: https://github.com/rust-lang/rust-clippy/issues/2831
[clippy_pr]: https://github.com/rust-lang/rust-clippy/pull/3248
[rustc_issue]: https://github.com/rust-lang/rust/pull/54679
[thanks]: https://github.com/rust-lang/rust-clippy/issues/2831#issuecomment-409411096
[rustc_docs]: https://doc.rust-lang.org/nightly/nightly-rustc/rustc_middle/
[rustc_guide]: https://rust-lang.github.io/rustc-guide/
[ariel]: https://github.com/arielb1
[ariel_comment]: https://github.com/rust-lang/rust-clippy/issues/2831#issuecomment-425732417
[gfi]: https://github.com/rust-lang/rust-clippy/labels/good%20first%20issue
[input_types]: https://doc.rust-lang.org/nightly/nightly-rustc/rustc_middle/ty/struct.TraitRef.html#method.input_types
[substs]: https://rust-lang.github.io/rustc-guide/ty.html?highlight=substs#beyond-types-other-kinds-of-arena-allocated-data-structures
