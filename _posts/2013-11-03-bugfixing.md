---
layout: post
title: Worthwhile bugfixing
aliases: [""]
---

While I was working on a new version of [Jou](https://github.com/phansch/jou), I suddenly stumbled across a roadblock.

<a href="/assets/images/posts/2013-11-03-bugfixing/rspec_failure.png" class="thumbnail">
  <img src="/assets/images/posts/2013-11-03-bugfixing/rspec_failure.png" alt="screenshot" />
</a>
> What?! Expectation equals result, so why would it fail?!

That was my first thought. 

It might be useful to know what the test and `get_recent` look like.

Here's a breakdown of the spec:
{%highlight ruby%}
before do
  # Create a basic temporary journal file
  @journal_file = Tempfile.new('jou_test')
  @journal = Journal.new(@journal_file.path)

  @today = Date.today.strftime("%y.%m.%d")
end

it "returns a string with entries from today" do
  @journal.add("hi!")
  @journal.add("ho!")
  @journal.get_recent(1).should == "### #{@today}\n * hi!\n * ho!\n\n"
ends
{%endhighlight%}

And `get_recent`:

{%highlight ruby%}
def get_recent(limit = 5)
  out = ""

  self.each_pair do |date, entries|
    break if limit == 0

    out << "### #{date}­\n"
    entries.each { |entry| out << " * #{entry}\n" }
    out << "\n"
    limit -= 1
  end

  out
end
{%endhighlight%}

My first guess was that the failing test was caused by using `==`. Luckily I've heard about 
different [equality matchers in rspec](https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/equality-matchers) before. I looked them up and it turns out that using `==` is 
indeed the right choice to compare the values of two different objects. 

Then I decided to run the test on the command line instead of using [RubyTest](https://packagecontrol.io/packages/RubyTest) inside Sublime Text. Maybe, for whatever reason, it would show something that RubyTest doesn't. 

<a href="/assets/images/posts/2013-11-03-bugfixing/rspec_failure2.png" class="thumbnail">
  <img src="/assets/images/posts/2013-11-03-bugfixing/rspec_failure2.png" alt="screenshot" />
</a>

Well, how did that hyphen get there and why didn't it show up in Sublime Text?
First, let's see if the hyphen is actually in the file and not just present on the command line. 
I'm using the [HexView plugin](https://packagecontrol.io/packages/HexViewer) to check the actual content of the file.

<a href="/assets/images/posts/2013-11-03-bugfixing/hex.png" class="thumbnail">
  <img src="/assets/images/posts/2013-11-03-bugfixing/hex.png" alt="screenshot" />
</a>

Well there it is. `c2ad`. In Unicode that's `U+00AD` ­­­­­­- the [soft hyphen](http://www.fileformat.info/info/unicode/char/00ad/index.htm). You can see a demonstration of the soft hyphen on [wikipedia](https://en.wikipedia.org/wiki/Soft_hyphen).

Now that I found the character, I was able to remove it and the test succeeds. But that doesn't answer the two questions from above.

> How did that hyphen get there and why didn't it show up in Sublime Text?

I frankly have no idea how the hyphen got there but I can make some guesses on why it doesn't show up. Firstly, it could be the font that doesn't support the soft hyphen. However, since I'm using the same font (Ubuntu Mono) for Sublime Text and urxvt, that's not possible. After all, the soft hyphen was displayed on the command line. My guess is that Sublime Text treats the character as an invisible character as the unicode standard suggests:

> Despite its name, U+00AD - soft hyphen is not a hyphen, but rather an invisible format character used to indicate optional intraword breaks. As described in Section 16.2, Layout Controls, its effect on the appearance of the text depends on the language and script used.
<small>The Unicode Consortium. The Unicode Standard.  
<a href="http://www.unicode.org/versions/latest/">http://www.unicode.org/versions/latest/</a></small>

### Was it worthwhile?
Yes. I think that sometimes it is worth digging deep instead of reverting to a previous commit.
I'm still new to testing so looking into equality matchers surely didn't hurt. I also learned a lot about Unicode, which might come in handy at some point.

What about you? Do you revert to save time or do you prefer to get to the root of the issue? 
