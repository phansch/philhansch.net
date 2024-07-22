require 'test_helper'

class TopNavigationTest < CapybaraTestCase
  def test_about_link
    visit '/'
    click_link 'About'
    assert page.has_content? 'Resumè / CV'
  end

  def test_blog_link
    visit '/'
    click_link 'Blog'
    assert page.has_content? 'Monthly review'
  end
end
