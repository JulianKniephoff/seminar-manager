module ApplicationHelper
  def current_controller?(name)
    name.to_s == controller_name
  end

  def markdown(text)
    @markdown_renderer ||= Redcarpet::Markdown.new(
      MarkdownRenderer.new(escape_html: true),
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      autolink: true,
      strikethrough: true,
      underline: true,
      quote: true,
    )
    @markdown_renderer.render(text.to_s).html_safe
  end
end
