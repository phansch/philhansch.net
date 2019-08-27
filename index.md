---
layout: default
title: Philipp Hansch - Ruby, Rust and more
auto: false
---
# Philipp Hansch

<div id="index-top">
  I'm a Full Stack developer currently focusing on <a href="https://rust-lang.org">Rust</a> where I'm on the <a href="https://github.com/rust-lang-nursery/rust-clippy">Clippy</a> team. I appreciate clean and well tested code and enjoy playing with new technology.
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

{% for item in site.data.timeline limit:10 %}
  <article class="timeline-entry {{ item.type }}">
    {% include timeline_{{ item.type }} %}
  </article>
  {% if forloop.last != true %}<hr />{% endif %}
{% endfor %}

[ghproject]: https://github.com/users/phansch/projects/3#column-6248321
