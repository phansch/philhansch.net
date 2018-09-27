---
layout: default
title: Philipp Hansch - Ruby, Rust and more
auto: false
---
# Philipp Hansch

<div id="index-top">
  I'm a Full Stack developer currently focusing on [Rust](https://rust-lang.org) where I'm on the [Clippy](https://github.com/rust-lang-nursery/rust-clippy) team. I appreciate clean and well tested code and enjoy playing with new technology.
  Feel free to take a look at my <a title="My blog" href="http://phansch.net/archive/">writings</a> and [resumé](https://github.com/phansch/cv/blob/master/resume-philipp-hansch.pdf) as well.
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
