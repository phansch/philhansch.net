require 'test_helper'
require 'feed_validator'

class FeedTest < CapybaraTestCase
  def test_feed_is_valid
    skip 'The feed validator gem is not working correctly :('
    visit 'atom.xml'
    feed_validator.validate_data(page.body)
    assert feed_validator.valid?
  end

  private

  def feed_validator
    W3C::FeedValidator.new
  end
end
