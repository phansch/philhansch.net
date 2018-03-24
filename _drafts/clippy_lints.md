* Read the [Contributing](https://github.com/rust-lang-nursery/rust-clippy/blob/master/CONTRIBUTING.md) help first.
* TODO: summarize that file
* Find an issue to fix
* Make sure to understand the context fully

I start with creating a simple test file to come up with different edge cases
Then a create the lint, writing the docs. This helps me to properly understand the context.

LateLintPass is defined by the rustc linter, so are all the methods like check_attribute and check_item


Maybe the MetaItem is empty, if there is a newline?
