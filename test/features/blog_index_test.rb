require 'test_helper'

class BlogIndexTest < CapybaraTestCase
  def test_read_more_link
    visit '/writing'
    assert page.has_content? 'Read more'
    first('.comment_look').click_link('Read more')
    assert page.has_content? 'min read'
  end
end
