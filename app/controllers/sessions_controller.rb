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

  def failure
    # TODO Should we know about the env here?
    @message = t(env['omniauth.error.type'], scope: :omniauth)
    render :new
  end
end
