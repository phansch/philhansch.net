require 'test_helper'

class BlogIndexTest < CapybaraTestCase
  def test_read_more_link
    visit '/writing'
    assert page.has_content? 'Read more'
    first('.comment_look').click_link('Read more')
    assert page.has_content? 'min read'
  end

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
