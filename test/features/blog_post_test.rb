require 'test_helper'

class BlogPostTest < CapybaraTestCase
  def test_latest_post_no_backtick_formatting
    posts_with_backticks = Dir['_posts/*.md'].select do |f|
      content = File.read(f)
      content.include?("```")
    end

    assert posts_with_backticks.empty?,
      "The following file(s) contain ```. Replace them with `{% highlight xxx %}`:\n#{posts_with_backticks.join("\n")}"
  end

  def test_time_to_read
    visit '2017/02/12/a-better-pry-prompt-for-rails-console'
    assert page.has_content? '2 min read'
  end

  def test_date_format
    visit '2014/04/13/sideproject-screenshot-streamer'
    assert page.has_content? '13 Apr 2014'
  end
end
