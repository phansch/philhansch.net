require 'test_helper'

class TopNavigationTest < CapybaraTestCase
  def test_about_link
    visit '/'
    click_link 'About'
    assert page.has_content? 'Resumè / CV'
  end

  def test_reading_link
    visit '/'
    click_link 'Reading'
    assert page.has_content? 'reading list'
  end

  def test_blog_link
    visit '/'
    click_link 'Blog'
    assert page.has_content? 'min read'
  end
end
