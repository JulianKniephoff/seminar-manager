module ApplicationHelper
  def current_controller?(name)
    name.to_s == controller_name
  end
end
