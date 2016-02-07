module ApplicationHelper
  def current_controller?(name)
    name.to_s == controller_name
  end

  def markdown(text)
    markdown_renderer.render(text).html_safe
  end

  private
    def markdown_renderer
      @markdown_renderer ||= Redcarpet::Markdown.new(
        Redcarpet::Render::HTML
      )
    end
end
