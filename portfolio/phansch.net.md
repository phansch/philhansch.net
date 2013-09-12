---
layout: portfolio-detail
title: phansch.net
github: phansch.github.com
subtitle: My website and portfolio.
scope: portfolio
category: misc
thumbnail: "/assets/images/portfolio/phanschnet/thumbnail.png"
used: [HTML5, CSS, JS, Jekyll, github-pages]
---

This website is based on HTML5, CSS and Javascript. It uses Jekyll to generate a static website whenever I push new content to the repository on GitHub. The posts are written in markdown and are kept in a seperate branch until they are published.

Development of changes or new features happens in different branches, depending on the task. Before a change makes it to the actual website, it is tested on a local jekyll server.

**Statistics: **

* [Network graph](https://github.com/phansch/phansch.github.com/network)
* [Contribution activity](https://github.com/phansch/phansch.github.com/contributors)
* [Activity per day/hour](https://github.com/phansch/phansch.github.com/graphs/punch-card)

<h2 id="screenshots">Screenshots</h2>
<div class="row">
  <div class="col-md-6">
    <a href="/assets/images/portfolio/phanschnet/phanschnet-1.png" class="thumbnail">
      <img src="/assets/images/portfolio/phanschnet/phanschnet-1.png" alt="screenshot" width="300" />
    </a>
  </div>
  <div class="col-md-6">
    <a href="/assets/images/portfolio/phanschnet/phanschnet-2.png" class="thumbnail">
      <img src="/assets/images/portfolio/phanschnet/phanschnet-2.png" alt="screenshot" width="300" />
    </a>
  </div>
</div>

<h2 id="snippets">Code snippets</h2>

{% highlight html linenos %}
{% raw %}
  <div class="row">
    {% for page in site.pages %}
      {% if page.scope == "portfolio" and page.category == "games" %}
        <div class="col-md-4">
          <div class="thumbnail">
            <a href="{{page.url}}">
              <img class="thumb" src="{{page.thumbnail}}" alt="Screenshot">
            </a>
            <h3>{{page.title}}
            {% if page.new %}
              <span class="label label-primary">New</span>
            {% endif %}
            </h3>
            <p>{{page.subtitle}}</p>
            <div class="tech">
              {% for technology in page.used %}
              <span class="label label-primary">{{ technology }}</span><br />
              {% endfor %}
            </div>
            <div class="buttons">
              <a href="{{ page.url }}">
                <button type="button" class="btn btn-default btn-sm">
                  <span class="glyphicon glyphicon-chevron-right"></span> More information
                </button>
              </a>
              {% if page.exe %}
              <a href="{{ page.exe }}">
                <button type="button" class="btn btn-default btn-sm">
                  <span class="glyphicon glyphicon-save"></span> .exe
                </button>
              </a>
              {% else %}
              <button type="button" class="btn btn-default btn-sm disabled">
                <span class="glyphicon glyphicon-save"></span> .exe
              </button>
              {% endif %}
              <a href="http://github.com/phansch/{{ page.title }}">
                <button type="button" class="btn btn-default btn-sm">
                  <span class="glyphicon glyphicon-share"></span> GitHub
                </button>
              </a>
            </div>
          </div>
        </div>
      {% endif %}
    {% endfor %}
  </div>
{% endraw %}
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> Generates the preview-boxes on the portfolio start page. This is iterating through all pages and creates a new thumbnail box if the page is of a specific scope and category.

----

{% highlight html linenos %}
{% raw %}
{% for post in posts_collate  %}
  {% capture this_year %}{{ post.date | date: "%Y" }}{% endcapture %}
  {% capture this_month %}{{ post.date | date: "%B" }}{% endcapture %}
  {% capture next_year %}{{ post.previous.date | date: "%Y" }}{% endcapture %}
  {% capture next_month %}{{ post.previous.date | date: "%B" }}{% endcapture %}

  {% if forloop.first %}
    <h2>{{this_year}}</h2>
    <ul class="list-unstyled archive">
  {% endif %}

  <li>
    <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
    <em>{{ post.date | date: "%b %d" }}</em>
  </li>

  {% if forloop.last %}
    </ul>
  {% else %}
    {% if this_year != next_year %}
      </ul>
      <h2>{{next_year}}</h2>
      <ul class="list-unstyled archive">
    {% endif %}
  {% endif %}
{% endfor %}
{% endraw %}
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> Generates the [archive](/archive/) page.

<h2 id="download">Download</h2>
<p class="text-muted">No download available.</p>

