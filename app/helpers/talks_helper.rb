module TalksHelper
  # TODO Relying on "global variables" here is ugly
  def current_talks_page?
    current_page?(current_talks_path) ||
      (@talk.present? && @talk.in_semester?(current_semester))
  end

  def archived_talks_page?
    current_page?(archived_talks_path) ||
      (@talk.present? && @talk.before_semester?(current_semester))
  end
end
