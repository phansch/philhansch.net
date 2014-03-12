---
layout: post
title: Fun with Unicode and UTF
excerpt: An excercise from my when I was studying Applied Computer Science.
---
Just to get this out of the way: **This has no practical usage as far as I know.**

This post shows how to convert Unicode Codepoints into UTF format (UTF8, UTF16 and UTF32) and vice versa **by hand**.

Yes you read that right. At the time we were handed this assignment at university, we all thought it was pretty useless. I have yet to find some way to apply this knowlegde. But even though I never had to use this since university, it's nice to keep this in my head. This is merly a fun excercise in problem solving.

Maybe one day it will save your life.

![](http://imgs.xkcd.com/comics/regular_expressions.png)


## Unicode &#8644; UTF8 conversion table

TODO: Add a simple example before introducing the table
<table class="table table-striped table-hover table-condensed">
  <tr>
    <th>Unicode</th>
    <th>UTF</th>
    <th>Plane</th>
  </tr>

  <tr>
    <td>0x000000 - 0x00007F</td>
    <td>0xxxxxx</td>
    <td>Plane 0, 0 - 127 (ASCII)</td>
  </tr>

  <tr>
    <td>0x000080 - 0x0007FF</td>
    <td>110yyyxxx 10xxxxx</td>
    <td>Plane 0, 128 - 2047</td>
  </tr>

  <tr>
    <td>0x000800 - 0x00FFFF</td>
    <td>1110yyyy 10yyyyxx 10xxxxxx</td>
    <td>Plane 0, 2048 - 65535</td>
  </tr>

  <tr>
    <td>0x010000 - 0x10FFFF</td>
    <td>11110zzz 10zzyyyy 10yyyyxx 10xxxxxx</td>
    <td>Plane &#8805; 1</td>
  </tr>
</table>

Don't worry, this will all make sense.
The first exercise: Converting UTF 
