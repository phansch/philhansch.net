---
layout: post
title: Fun with Unicode and UTF
excerpt: An excercise from my when I was studying Applied Computer Science.
---
Just to get this out of the way: **This has no practical usage as far as I know.**

This post shows how to convert Unicode Codepoints into UTF format and vice versa *by hand*. Here is your first exercise:

> What is the UTF8 representation of the Unicode codepoint `U+D36F`?

Yes you read that right. At the time we were handed this assignment at university, we all thought it was pretty useless. I have yet to find some way to apply this knowlegde. But even though I never had to use this since university, it's nice to keep this in my head. This is merly a fun excercise in problem solving.

But, maybe one day it will save your life.

<img src="http://imgs.xkcd.com/comics/regular_expressions.png" />

<small class="text-muted">From <a href="https://xkcd.com/208/">xkcd #208 &mdash; Regular Expressions</a>.</small>

**Note:** I highly encourage you to read up on the [technical introduction to Unicode](http://www.unicode.org/standard/principles.html) to gain a basic understanding of what Unicode and UTF are.

---

## Unicode &#8644; UTF conversion tables

These two tables will help you map Unicode codepoints to UTF. Don't worry about understanding these tables for now. They will make sense once you are working on your first exercise.

<table class="table table-striped table-hover unicode">
  <thead>
  <tr>
    <th>Unicode Range</th>
    <th>UTF8 (binary)</th>
    <th>Plane</th>
    <th>Codepoints</th>
  </tr>
  </thead>
  <tbody>

  <tr>
    <td>U+00<span class="bg-green">00</span> - U+00<span class="bg-green">7F</span></td>
    <td>0<span class="bg-green">xxxxxx</span></td>
    <td>Plane 0</td>
    <td>0 - 127</td>
  </tr>

  <tr>
    <td>U+<span class="bg-orange">00</span><span class="bg-green">80</span> - U+<span class="bg-orange">07</span><span class="bg-green">FF</span></td>
    <td>110<span class="bg-orange">yyy</span><span class="bg-green">xxx</span> 10<span class="bg-green">xxxxx</span></td>
    <td>Plane 0</td>
    <td>128 - 2047</td>
  </tr>

  <tr>
    <td>U+<span class="bg-orange">08</span><span class="bg-green">00</span> - U+<span class="bg-orange">FF</span><span class="bg-green">FF</span></td>
    <td>1110<span class="bg-orange">yyyy</span> 10<span class="bg-orange">yyyy</span><span class="bg-green">xx</span> 10<span class="bg-green">xxxxxx</span></td>
    <td>Plane 0</td>
    <td>2048 - 65535</td>
  </tr>

  <tr>
    <td>U+<span class="bg-blue">01</span><span class="bg-orange">00</span><span class="bg-green">00</span> - U+<span class="bg-blue">10</span><span class="bg-orange">FF</span><span class="bg-green">FF</span></td>
    <td>11110<span class="bg-blue">zzz</span> 10<span class="bg-blue">zz</span><span class="bg-orange">yyyy</span> 10<span class="bg-orange">yyyy</span><span class="bg-green">xx</span> 10<span class="bg-green">xxxxxx</span></td>
    <td>Plane &#8805; 1</td>
    <td>&gt; 65535</td>
  </tr>
  </tbody>
</table>
---
<table class="table table-striped table-hover unicode">
  <thead>
  <tr>
    <th>Unicode Range</th>
    <th>UTF16 (binary)</th>
    <th>Plane</th>
    <th>Codepoints</th>
  </tr>
  </thead>
  <tbody>

  <tr>
    <td>U+<span class="bg-orange">00</span><span class="bg-green">00</span> - U+<span class="bg-orange">FF</span><span class="bg-green">FF</span></td>
    <td><span class="bg-orange">yyyyyyyy</span>  <span class="bg-green">xxxxxxxx</span></td>
    <td>Plane 0</td>
    <td>0 - 65535</td>
  </tr>

  <tr>
    <td>U+<span class="bg-blue">01</span><span class="bg-orange">00</span><span class="bg-green">00</span> - U+<span class="bg-blue">10</span><span class="bg-orange">FF</span><span class="bg-green">FF</span></td>
    <td>
      110110<span class="bg-pink">vv</span> <span class="bg-pink">vv</span><span class="bg-orange">yyyyyy</span> 110111<span class="bg-orange">yy</span> <span class="bg-green">xxxxxxxx</span><br />
      * <span class="bg-pink">vvvv</span> = <span class="bg-blue">zzzzz</span> - 1
    </td>
    <td>Plane &#8805; 1</td>
    <td>&gt; 65535</td>
  </tr>
  </tbody>
</table>

## Unicode to UTF8

The first step is to determine what Unicode Area the provided Unicode code point is in.

Let's start with the Unicode codepoint `U+D36F`

Looking at the table tells us we are dealing with a code point in plane 0. The table also tells us how the unicode codepoint maps to UTF8.

The next step is to actually start converting the code point to UTF8.
We start by converting the codepoint to binary.
We really only care for the last byte as the other bytes are zero:

<p class="unicode">
D3: <span class="bg-orange">1101 0011</span><br />
6F: <span class="bg-green">0110 1111</span>
</p>

The next step is to map the binary representation of our codepoint to UTF8. The colors are your guide for putting the bits in the right place. The bits in the unicode codepoint will be distributed among the UTF bytes. It will make sense after this example.
<p class="unicode">
1110<span class="bg-orange">1101</span> 10<span class="bg-orange">0011</span><span class="bg-green">01</span> 10<span class="bg-green">101111</span>
</p>

The next step is to convert this to hexadecimal. We end up with:

ED8DAF


## Converters in Ruby

Unicode to UTF
{%highlight ruby%}
unicode = "\ud36f"
utf = ""

unicode.each_byte do |byte|
  utf << byte.to_s(16).upcase
end

puts "UTF: " + utf
{%endhighlight%}

