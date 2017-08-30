require 'test_helper'

class TopNavigationTest < CapybaraTestCase
  def test_portfolio_link
    visit '/'
    click_link 'Portfolio'
    assert page.has_content? 'Contact'
  end

  def test_reading_link
    visit '/'
    click_link 'Reading'
    assert page.has_content? 'Reading List'
  end

  def test_writing_link
    visit '/'
    click_link 'Writing'
    assert page.has_content? 'Read more'
  end
end
