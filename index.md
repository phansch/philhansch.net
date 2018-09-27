---
layout: default
title: Philipp Hansch - Ruby, Rust and more
auto: false
---
# Philipp Hansch

<div id="index-top">
  <div id="tagline">
    <p>I'm a Full Stack developer currently focusing on <a href="https://rust-lang.org">Rust</a> where I'm on the <a href="https://github.com/rust-lang-nursery/rust-clippy">Clippy</a> team. I appreciate clean and well tested code and enjoy playing with new technology.
    Feel free to take a look at my <a title="My blog" href="http://phansch.net/archive/">writings</a> and <a href="https://github.com/phansch/cv/blob/master/resume-philipp-hansch.pdf">resumé</a> as well.</p>
  </div>
</div>

* [Resumè / CV (pdf)](https://github.com/phansch/cv/raw/master/resume-philipp-hansch.pdf)
* [GitHub](http://github.com/phansch)
* [LinkedIn](https://www.linkedin.com/in/philipphansch/)

## Recent

{% for item in site.data.timeline limit:10 %}
  <article class="timeline-entry {{ item.type }}">
    {% include timeline_{{ item.type }} %}
  </article>
  {% if forloop.last != true %}<hr />{% endif %}
{% endfor %}
