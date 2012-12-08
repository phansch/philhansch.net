---
layout: page
title: Archive
---
# Archive #
<br />
<p>
{% for post in site.posts %}
  {% if post.wordpress_id == null and post.plyturonnet == null %}
    <a class="archive-post-title" href="{{ post.url }}">{{ post.title }}</a><br />
    &raquo; <span class="archive-date">{{ post.date | date_to_string }}</span><br />
  {% endif %}
{% endfor %}
</p>
# phansch.de #

<small>All posts from my old blog on blog.phansch.de. The early ones are in German and I do not plan on translating them.</small>
<p id="phansch">
{% for post in site.posts %}
  {% if post.wordpress_id != null and post.plyturonnet == null %}
    <a class="archive-post-title" href="{{ post.url }}">{{ post.title }}</a><br />
    &raquo; <span class="archive-date">{{ post.date | date_to_string }}</span><br />
  {% endif %}
{% endfor %}
</p>

# plyturon.net #

<small>Posts from plyturon.net. My old gaming blog.</small>
<p id="plyturon">
{% for post in site.posts %}
  {% if post.plyturonnet %}
    <a class="archive-post-title" href="{{ post.url }}">{{ post.title }}</a><br />
    &raquo; <span class="archive-date">{{ post.date | date_to_string }}</span><br />
  {% endif %}
{% endfor %}
</p>
<a href="#">Back to top</a>