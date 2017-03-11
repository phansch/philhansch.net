require 'test_helper'

class ArchiveTest < CapybaraTestCase
  def test_archive_link_from_index
    visit '/'
    click_link 'archive'
    assert page.has_content?('Archive')
    assert page.has_content?('Browse all')
  end

  def test_archive_contains_oldest_post
    visit '/archive'
    assert page.has_content? 'Aller Anfang ist schwer'
  end

  def test_archive_contains_newest_post
    visit '/archive'
    assert page.has_content? 'Testing your Jekyll Website with Capybara'
  end

  def test_archive_date_format
    visit '/archive'

    assert page.has_content? 'Mar 30'
    assert page.has_content? 'May 18'
    assert page.has_content? 'Dec 31'
  end
end
