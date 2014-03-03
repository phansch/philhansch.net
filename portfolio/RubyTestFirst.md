---
layout: portfolio-detail
title: Ruby Test-First
github: learn_ruby_solutions
subtitle: Practicing test-driven development.
scope: portfolio
category: ruby
new: true
thumbnail: "/assets/images/portfolio/RubyTestFirst/thumbnail.png"
used: [Ruby, rspec]
---

<a id="snippets" class="anchor"></a>
## Code snippets

{% highlight ruby %}
{% raw %}
class RPNCalculator
  attr_reader :value

  def initialize
    @stack = []
  end

  def push(number)
    @stack.push(number)
  end

  def plus
    calc("+")
  end

  def minus
    calc("-")
  end

  def divide
    calc("/")
  end

  def times
    calc("*")
  end

  # Tokenizes a string
  def tokens(string)
    tokens = string.split(' ')
    tokens.each_index do |i|
      tokens[i] = tokens[i].to_sym if %W(+ - * /).include?(tokens[i])
      tokens[i] = Integer(tokens[i]) unless %i(+ - * \/).include?(tokens[i])
    end
  end

  # Evaluates a string in postfix notation and returns the result
  def evaluate(postfix)
    tokens = tokens(postfix)
    tokens.each do |token|
      if token.is_a?(Fixnum)
        push(token)
      elsif %i(+ - * \/).include?(token)
          calc(token.id2name)
      end
    end
    @value
  end

  private

  # Calculation method. Uses Object.send to do math operations
  def calc(op)
    raise "calculator is empty" if @stack.empty?

    num_a, num_b = @stack.pop(2)
    @value = num_a.to_f.send(op, num_b.to_f) # Object.send
    push(@value)
  end
end
{% endraw %}
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> Implementation of a calculator class for [Reverse Polish Notation](http://en.wikipedia.org/wiki/Reverse_Polish_notation).

<p>Example usage:</p>

{% highlight ruby %}
{% raw %}
    calculator.push(2)
    calculator.push(3)
    calculator.plus
    # calculator.value == 5
{% endraw %}
{% endhighlight %}
----
