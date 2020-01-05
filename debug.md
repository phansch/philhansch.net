{% assign timeline_with_posts = site.data.timeline | concat: site.posts %}

{% assign sorted = timeline_with_posts | sort: 'date' | reverse %}
{% for item in sorted limit:10 %}
date: {{ item.date inspect }}

{% endfor %}
