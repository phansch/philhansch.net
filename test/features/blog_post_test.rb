require 'test_helper'

class BlogPostTest < CapybaraTestCase
  def test_latest_post_no_highlight_formatting
    posts_with_highlight = all_posts.select do |f|
      content = File.read(f)
      content.include?("{% highlight")
    end

    assert posts_with_highlight.empty?,
      "The following file(s) contain {% highlight xxx %}. Replace them with: ```xxx:\n#{posts_with_highlight.join("\n")}"
  end

  def test_time_to_read
    visit 'posts/a-better-pry-prompt-for-rails-console'
    assert page.has_content? '2 min read'
  end

  def test_date_format
    visit 'posts/sideproject-screenshot-streamer'
    assert page.has_content? '2014-04-13'
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
    @_all_posts ||= Dir['content/posts/*.md']
  end
end
