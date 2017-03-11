require 'test_helper'

class IndexTest < CapybaraTestCase
  def test_name_exists
    visit '/'
    assert page.has_content?('Philipp Hansch')
  end

  def test_cv_link
    visit '/'
    click_link 'Resumè / CV'
    assert page.current_url == 'https://gitlab.com/phansch/latex-resume/raw/master/resume-philipp-hansch.pdf'
  end
end
