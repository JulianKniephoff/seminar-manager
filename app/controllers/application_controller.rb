class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # TODO These belong in their own module?
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? nil : user.id
  end

  def current_semester
    # TODO Get this from the database or a configuration file
    # NOTE That this specifically is not a wrapper for `Semester.current`!
    @current_semester ||= Semester.new(2016, Semester::SUMMER)
  end
  helper_method :current_semester

  # TODO This does also not belong here
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to login_path(origin: request.original_url), alert: exception.message
  end
end
