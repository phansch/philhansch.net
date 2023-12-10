# frozen_string_literal: true

require 'test_helper'

class AliasesTest < Minitest::Test
  def test_aliases
    Dir.glob('_posts/*.md').each do |post_path|
      post_lines = File.readlines(post_path)

      assert post_lines.any? { |l| l.start_with?('aliases') }, "Post is missing `aliases`: #{post_path}"

      # We're hand-parsing the front matter because it's independent of the
      # syntax. It should work with YAML and TOML.
      post_lines.each_with_index do |line, index|
        if line.start_with?('aliases')
          aliases = line.split(' ').last
          # We should now have `["the/aliased/path"]`
          assert aliases.length > 4, "Alias too short: `#{aliases}` in `#{post_path}`"
          break
        end
      end
    end
  end
end
