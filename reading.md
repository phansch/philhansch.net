---
layout: page
title: Reading List
---
<h1>The Reading List</h1>
I started this list in early 2014 after reading *Apprenticeship Patterns* by Dave Hoover.

If you think I'm missing an important book on this list, [let me know](http://twitter.com/phansch).

<h3>Books I'm going to read next</h3>

{% for book in site.data.books %}
  {% unless book.readDate %}
  <p class="book">
    <strong>{{ book.title }}</strong>
    <br />by {{ book.author }} &sdot; {{ book.pages }} Pages
  </p>
  {% endunless %}
{% endfor %}

<h3>Books I've read / still reading</h3>
{% for book in site.data.books %}
  {% if book.readDate %}
  <p class="book">
    <strong>{{ book.title }}</strong> in {{ book.readDate }}
    <br />by {{ book.author }} &sdot; {{ book.pages }} Pages
  </p>
  {% endif %}
{% endfor %}
