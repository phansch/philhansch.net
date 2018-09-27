require 'test_helper'

class BlogIndexTest < CapybaraTestCase
  def test_dot_at_end_of_excerpt
    visit '/writing'

    excerpt_texts = all('a.body-text').map(&:text)
    last_letters = excerpt_texts.map { |t| t[-1] }
    allowed_chars = %w[. ? !]

    assert_empty(
      last_letters - allowed_chars,
      "Excerpt must end with one of #{allowed_chars.join} "
    )
  end
end
