---
layout: portfolio-detail
title: phansch.net
github: phansch.github.com
subtitle: This portfolio and website
scope: portfolio
category: misc
thumbnail: #
used: [HTML5, CSS, JS, Jekyll, github-pages]
---

This website is based on HTML5, CSS and Javascript. It uses Jekyll to generate a static website whenever I push new content to the repository on GitHub. The posts are written in markdown and are kept in a seperate branch until they are published.

<h2 id="screenshots">Screenshots</h2>

<h2 id="snippets">Code snippets</h2>

{% highlight html linenos %}
{% raw %}
 <div class="row">
      {% for page in site.pages %}
        {% if page.scope == "portfolio" and page.category == "games" %}
          <div class="col-md-4">
            <a href="{{page.url}}" class="thumbnail">
              <img src="{{page.thumbnail}}" alt="Screenshot">
            </a>
            <h3>{{page.title}} <span class="label label-primary">New</span></h3>
            <p style="text-align:justify">{{page.subtitle}}</p>
            Technologies: <br />
            {% for technology in page.used %}
            <span class="label label-default">{{ technology }}</span>
            {% endfor %}
            
            <a href="{{ page.url }}">
              <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-fullscreen"></span> More information
              </button>
            </a>
            {% if page.exe %}
            <a href="{{ page.exe }}">
              <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-save"></span> .exe
              </button>
            </a>
            {% endif %}
            <a href="http://github.com/phansch/{{ page.title }}">
            	<button type="button" class="btn btn-default">
            	 <span class="glyphicon glyphicon-share"></span> GitHub
            	</button>
        	 </a>
          </div>
        {% endif %}
      {% endfor %}
    </div>
    {% endraw %}
{% endhighlight %}
Generates the preview-boxes on the portfolio start page.

{% highlight html linenos %}
{% raw %}
{% for post in posts_collate  %}
    {% capture this_year %}{{ post.date | date: "%Y" }}{% endcapture %}
    {% capture this_month %}{{ post.date | date: "%B" }}{% endcapture %}
    {% capture next_year %}{{ post.previous.date | date: "%Y" }}{% endcapture %}
    {% capture next_month %}{{ post.previous.date | date: "%B" }}{% endcapture %}

    {% if forloop.first %}
      <h2>{{this_year}}</h2>
      <ul class="archive">
    {% endif %}

    <li>
	    <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a> 
	    <span>{{ post.date | date: "%b %d" }}</span>
    </li>

    {% if forloop.last %}
      </ul>
    {% else %}
      {% if this_year != next_year %}
        </ul>
        <h2>{{next_year}}</h2>
        <ul class="archive">
      {% endif %}
    {% endif %}
  {% endfor %}
  {% endraw %}
{% endhighlight %}
[Network graph of the repository](https://github.com/phansch/phansch.github.com/network)