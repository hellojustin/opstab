require 'diff_to_html'

module NotificationsHelper

  def convert_to_formatted_diff( raw_diff )

    converter = GitDiffToHtml.new
    converter.composite_to_html raw_diff

  end

end
