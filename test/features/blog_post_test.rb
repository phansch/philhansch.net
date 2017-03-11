require 'test_helper'

class BlogPostTest < CapybaraTestCase
  def test_time_to_read
    visit '2017/02/12/a-better-pry-prompt-for-rails-console'
    assert page.has_content? '2 min read'
  end

  def test_date_format
    visit '2014/04/13/sideproject-screenshot-streamer'
    assert page.has_content? '13 Apr 2014'
  end
end
