require 'test_helper'

class IndexTest < CapybaraTestCase
  def test_name_exists
    visit '/'
    assert page.has_content?('Philipp')
  end

  def test_cv_link
    visit '/'
    click_link 'Resumè / CV'
    assert_equal 'http://www.example.com/resume-philipp-hansch.pdf', page.current_url
  end
end
