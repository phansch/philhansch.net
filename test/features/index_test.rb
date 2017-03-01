require 'test_helper'

class IndexTest < CapybaraTestCase
  def test_name_exists
    visit '../_site/index.html'
    assert page.has_content?('Philipp Hansch')
  end
end
