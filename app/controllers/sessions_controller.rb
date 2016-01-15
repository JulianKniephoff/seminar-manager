class SessionsController < ApplicationController
  def new
  end

  def create
    # TODO Redirect to where we came from
    redirect_to root_path
  end

  def destroy
    # TODO Redirect to where we came from
    redirect_to login_path
  end
end
