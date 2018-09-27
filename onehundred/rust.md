---
layout: page
title: One Hundred Rust PRs
---

# One Hundred Rust PRs

<div class="onehundred-widget">
  <div class="progressbar">
    <div class="value" style="width: {{ site.data.timeline | where: 'language','Rust' | size }}%; max-width: 100%">
      <div class="text">{{ site.data.timeline | where: 'language','Rust' | size }} / 100</div>
    </div>
  </div>
</div>

<p>Hi there! I decided to set up this little thing where I track my progress of learning Rust and contributing to its ecosystem. </p>
### Why 100?
<p>
I wont stop at 100 but I feel like it's a good enough count to be reachable but also requiring a significant amount of commitment.
</p>

### What counts?
<p>
I decided to only count contributions to other projects because it prevents me from cheating the count by creating dozens of small pull requests to my own projects. It also means that pretty much every PR will benefit the Rust ecosystem in some way.
</p>
<br />

{% for item in site.data.timeline | where: 'language','Rust' %}
  {% if item.language != 'Rust' %}
    {% continue %}
  {% endif %}
  <article class="timeline-entry {{ item.type }}">
    {% include timeline_{{ item.type }} %}
  </article>
  {% if forloop.last != true %}<hr />{% endif %}
{% endfor %}
