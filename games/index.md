---
layout: default
title: Game Portfolio
---

<h1 class="front">{{ page.title }}</h1>
I am a programmer who casually writes games from time to time. Please direct all correspondence to [desk@phansch.net](mailto:desk@phansch.net). You can also find my contact information at the bottom of the page. 


{% for page in site.pages %}
  {% if page.scope == "portfolio" %}

[{{page.title}}]({{ page.url}})  
{{page.subtitle}}.

  {% endif %}

{% endfor %}