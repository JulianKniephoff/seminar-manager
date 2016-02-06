module ApplicationHelper
  def current_controller?(name)
    name.to_s == controller_name
  end

  def semester(year, term)
    "#{['Sommer', 'Winter'][term - 1]}semester #{year}#{"/#{year + 1}" if term == 2}"
  end
end
