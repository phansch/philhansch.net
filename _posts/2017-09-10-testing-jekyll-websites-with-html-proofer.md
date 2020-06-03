---
layout: post
title: Testing your Jekyll Website with HTMLProofer
excerpt: Dealing with link rot and broken HTML.
aliases: [""]
---

While I was adding [Capybara tests]({% post_url 2017-03-13-testing-jekyll-websites %}) for this Website, I also stumbled upon [HTMLProofer](https://github.com/gjtorikian/html-proofer).

HTMLProofer allows to test your HTML output. It can check alt tags of images, if links are working and a few more things.

I decided to give it a try on my website. Initially I was surprised at the amount of output and decided that it was too much to fix all at once. So first, I only had it check for broken links. It found about 30 of 200 outgoing links that were not working.

Most of them were part of of my Hackership series where I sometimes linked to local startups that apparently didn't make it until today. Unfortunately [Link Rot](https://en.wikipedia.org/wiki/Link_rot) is a thing.

Before I dealt with all the broken links, I started to integrate HTMLProofer into the test suite by adding a custom Rake task:

{% highlight ruby %}
task :html_proofer do
  build_dir = File.join(File.dirname(__FILE__), '_site')
  unless File.directory?('test/_site')
    `jekyll build -d #{build_dir} -V`
  end
  opts = {
    url_ignore: [/localhost/],
    empty_alt_ignore: true,
    file_ignore: [/slides/],
    typhoeus: {
      ssl_verifyhost: 0,
      ssl_verifypeer: false,
      timeout: 30
    }
  }
  HTMLProofer.check_directory(build_dir, opts).run
end
{% endhighlight %}

Using `rake html_proofer` it builds the site and runs HTMLProofer with the given options on the Jekyll output.
You can check the Travis CI integration in [script/ci.rb](https://github.com/phansch/phansch.github.com/blob/master/script/ci.rb) and [.travis.yml](https://github.com/phansch/phansch.github.com/blob/master/.travis.yml).

If you run into SSL issues with HTMLProofer, you may have to [install](https://github.com/typhoeus/typhoeus/issues/568) `libcurl4-openssl-dev` on Travis.

The last thing I did, was to fix the links, as it was the least compelling part of the task. There are many reasons why a link may be broken and almost each cause can be handled differently.

* A missing article may be caused by a new URL structure and forgotten redirects, so I looked around on these sites and tried to find the correct link if possible.

* Broken domains are a lost cause most of the times, although some startups had renamed themselves or were bought up, so using the new domain makes sense there.

* Domains may be unreachable only temporarily, so I don't want to remove the link and instead whitelist it.

This all took some time, but it paid off and now I can be certain that there's no broken links in any of the HTML on this website.

As mentioned in the beginning, HTMLProofer has a couple of more nice features, but I didn't get around to trying them, yet. In the next post I will probably have a look at the other features.
