---
layout: default
title: Philipp Hansch - Ruby, Rust and more
auto: false
---

<div id="index-top">
  :wave: Hi, I'm Philipp, a full stack developer currently focusing on <a href="https://rust-lang.org">Rust</a> where I'm on the <a href="https://github.com/rust-lang-nursery/rust-clippy">Clippy</a> team. I appreciate clean and well tested code and enjoy playing with new technology.
  Feel free to take a look at my <a title="My blog" href="http://phansch.net/archive/">writings</a> and <a href="https://github.com/phansch/cv/blob/master/resume-philipp-hansch.pdf">resumé</a> as well.
</div>

<table id="index-link-table">
  <tr>
    <td>
      <a href="https://github.com/phansch/cv/raw/master/resume-philipp-hansch.pdf">Resumè / CV (pdf)</a>
    </td>
    <td>
      <a href="http://github.com/phansch">GitHub</a>
    </td>
  </tr>
</table>

<h2>Recent</h2>

You can find my **in-progress** Rust work in [**this GitHub project**][ghproject].  
Below is a list of my last 10 merged pull requests.

{% comment %}

FIXME: This only works with Jekyll >= 4. GitHub pages is using Jekyll ~3.0 with
no signs of upgrading :(

{% assign timeline_with_posts = site.data.timeline | concat: site.posts %}
{% assign sorted = timeline_with_posts | sort: 'date' | reverse %}

{% endcomment %}

{% for item in site.data.timeline limit:10 %}
  {% assign item_type = item.type | default: 'blog' %}

  <article class="timeline-entry {{ item_type }}">
    {% include timeline_{{ item_type }} %}
  </article>
  {% if forloop.last != true %}<hr />{% endif %}
{% endfor %}

[ghproject]: https://github.com/users/phansch/projects/3#column-6248321
