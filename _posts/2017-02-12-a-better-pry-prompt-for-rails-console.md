---
title: "A better Pry prompt for the Rails console"
layout: post
excerpt: "A quick way to make your everyday work with Ruby on Rails a bit more safe."
---

*Update: This is now part of [pry-rails](https://github.com/rweng/pry-rails#custom-rails-prompt).*

On any given day I find myself with at least 2 rails consoles open at the same time. One for local development and one for the testing or production environment.
All share the same prompt.

In development:

{% highlight ruby %}
[1] pry(main)> User.destroy_all
{% endhighlight %}

In production:

{% highlight ruby %}
[2] pry(main)> DataCollector.collect
{% endhighlight %}


It would be really good to know **what** environment each rails console is operating on. While it is printed on the start of the rails console session, it usually quickly scrolls off the screen.

What if we accidentally removed the users on the wrong system? Sure, everyone has working backups, database replication and is also testing them regulary, right?

Even if we have working backups, we can still work on preventing accidents. Luckily we have complete control over the pry prompt through the [`.pryrc` configuration file](https://github.com/pry/pry/wiki/Customization-and-configuration#Config_prompt).

### The solution

A closer look at the [documentation](http://www.rubydoc.info/github/pry/pry/Pry/Helpers/Text) shows that we can easily make text bold and colored in the prompt:


{% highlight ruby %}
Pry::Helpers::Text.red('I am red.')
Pry::Helpers::Text.bold('I am bold.')
{% endhighlight %}

We get the project name using:

{% highlight ruby %}
File.basename(Rails.root)
{% endhighlight %}


The pry prompt can be overriden in the `.pryrc` with a custom proc:

{% highlight ruby %}
Pry.config.prompt = proc { |obj, nest_level, pry| 'NicerPrompt'}
{% endhighlight %}

Using the above, this is what I am using for all my personal and work projects:

{% highlight ruby %}
def formatted_env
  case Rails.env
  when 'production'
    bold_upcased_env = Pry::Helpers::Text.bold(Rails.env.upcase)
    Pry::Helpers::Text.red(bold_upcased_env)
  when 'staging'
    Pry::Helpers::Text.yellow(Rails.env)
  when 'development'
    Pry::Helpers::Text.green(Rails.env)
  else
    Rails.env
  end
end

def app_name
  File.basename(Rails.root)
end

if defined?(Rails)
  Pry.config.prompt = proc { |obj, nest_level, _| "[#{app_name}][#{formatted_env}] #{obj}:#{nest_level}> " }
end
{% endhighlight %}

Here is what it looks like:

![selection_220](https://cloud.githubusercontent.com/assets/2042399/22556063/31c05df0-e966-11e6-9a9a-fbfea33344c6.png)
![selection_218](https://cloud.githubusercontent.com/assets/2042399/22555944/c65dd894-e965-11e6-98e0-38368648c8bb.png)
![selection_219](https://cloud.githubusercontent.com/assets/2042399/22556006/0301be96-e966-11e6-84a7-a3fc54c93950.png)
