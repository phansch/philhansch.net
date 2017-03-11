require 'test_helper'

class IndexTest < CapybaraTestCase
  def test_name_exists
    visit 'index.html'
    assert page.has_content?('Philipp Hansch')
  end
end
