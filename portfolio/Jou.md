---
layout: portfolio-detail
title: Jou
github: Jou
subtitle: My first published Rubygem.
scope: portfolio
category: ruby
new: true
gem: jou
thumbnail: "/assets/images/portfolio/jou/thumbnail.png"
used: [Ruby, Gem, rspec]
---

Jou is a simple command line utility that helps with maintaining a journal file in markdown syntax.

#### Installation
    $ gem install jou

#### Configuration
The first time you start jou, you will have to specify the path to your journal file.  
Alternatively, you can edit `~/.jou`
#### Usage
    $ jou -h
    Usage: jou [options]
        -a, --add-entry String           Add an entry
        -s, --set-journal path/to/file   Set a new default file to write to and read from
        -h, --help, --usage              Show this message


Adding a journal entry is as simple as:

    $ jou -a "Today I tried out jou"


<a id="snippets" class="anchor"></a>
## Code snippets

{% highlight ruby %}
{% raw %}
# Reads the markdown file and converts it to a hash
def serialize
  active_date = ""
  entries = []
  begin
    File.foreach(@journal_file) do |line|
      if line.start_with?("###")
        active_date = line[4..-1].chomp.to_sym
        self[active_date] = {}
        entries = []
      elsif line.start_with?(" *")
        entry = line[3..-1].chomp
        self[active_date] = entries.push(entry)
      end
    end
  rescue Errno::ENOENT => e
    puts e.message
  end
end
{% endraw %}
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> Reading the markdown file and storing it in a hash.

----
