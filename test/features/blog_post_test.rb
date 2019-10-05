require 'test_helper'

class BlogPostTest < CapybaraTestCase
  def test_latest_post_no_backtick_formatting
    posts_with_backticks = all_posts.select do |f|
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

  def test_no_todo
    posts_with_todo = all_posts.select do |p|
      content = File.read(p)
      content.include?("TODO")
    end
    assert posts_with_todo.empty?,
      "The following file(s) contain TODO. Please resolve them:\n#{posts_with_todo.join("\n")}"
  end

  private

  def all_posts
    @_all_posts ||= Dir['_posts/*.md']
  end
end
