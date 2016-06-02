module ApplicationHelper
  def current_controller?(name)
    name.to_s == controller_name
  end

  def markdown(text)
    doc = Kramdown::Document.new(text)
    doc.to_remove_html_tags
    doc.to_html.html_safe
  end
end
