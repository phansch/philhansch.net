---
layout: portfolio
title: phansch.net
source: "https://gitlab.com/phansch/phansch-net/tree/master"
subtitle: My website and portfolio.
category: misc
thumbnail: "/assets/images/portfolio/phanschnet/thumbnail.png"
screenshots: [/assets/images/portfolio/phanschnet/phanschnet-1.png, /assets/images/portfolio/phanschnet/phanschnet-2.png]
used: [HTML5, CSS, JS, Jekyll, github-pages, bootstrap]
order: 4
---

This website is based on HTML5, CSS and Javascript. It uses Jekyll to generate a static website whenever I push new content to the repository on GitHub. The posts are written in markdown and are kept in a seperate branch until they are published.

Development of changes or new features happens in different branches, depending on the task. Before a change makes it to the actual website, it is tested on a local jekyll server.

<a id="snippets" class="anchor"></a>

## Code snippets

```html
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
```
<span class="glyphicon glyphicon-chevron-right"></span> Generates the preview-boxes on the portfolio start page. This is iterating through all pages and creates a new thumbnail box if the page is of a specific scope and category.

----

```html
{% raw %}
{% if page.exe %}
  <p>The fastest way to get the game running is to download the compiled .exe file below.</p>
  <a href="{{ page.exe }}" class="btn btn-primary btn-lg">
  <span class="glyphicon glyphicon-save"></span> Download .exe
  </a>
{% elsif page.gem %}
  <pre><code>$ gem install {{ page.gem }}</code></pre>
{% else %}
  <p>No download available.</p>
{% endif %}

{% if page.love or page.github %}
  <h3>Other files</h3>
{% endif %}

{% if page.love %}
  <h4><a href="#">.love file for Windows, Mac OSX and Linux platforms</a></h4>

  <p>If you don't have Love2D installed, download it <a href="http://love2d.org/">here</a> and install it first.

  To run the game:
  <ul>
      <li>On Linux, use <code>love /path/to/{{ page.github }}.love</code> to run the game.</li>
      <li>On Windows use <code>love C:\path\to\{{ page.github }}.love</code> <strong>or</strong> drag the .love file onto love.exe</li>
      <li>On Mac use <code>open -n -a love "/home/path/to/{{ page.github }}"</code> <strong>or</strong> drag the .love file onto the Love.app application bundle</li>
  </ul>
  </p>
{% endif %}

{% if page.github %}
  <h4><a href="http://github.com/phansch/{{ page.github }}">{{ page.title }} on GitHub</a></h4>
  Download the latest source or clone/fork the project on GitHub.
{% endif %}
{% endraw %}
```
<span class="glyphicon glyphicon-chevron-right"></span> Generates *Download* section below.

