class SessionsController < ApplicationController
  # TODO What are the security implications of this?
  # See https://github.com/intridea/omniauth/wiki/Managing-Multiple-Providers/2174dce6c804f7c25b407859dacd75a9c0fe8ac8
  # near the end
  #skip_before_filter :verify_authenticity_token, only: [:create, :failure]
  # NOTE It might only be needed when using `OmniAuth::Form`

  def new
  end

  def create
    # TODO Should we pack information about the auth_hash in here?
    # TODO Maybe we should not call this hash.
    # We can also access its values using accessors
    # plus its hashness is an implementation detail
    auth_hash = env['omniauth.auth']
    provider = auth_hash[:provider]

    authentication = Authentication.find_or_create_with_auth_hash(auth_hash)

    if authentication.user.blank?
      info = auth_hash[:info]
      authentication.create_user(name: info[:name], email: info[:email])
      authentication.save  # TODO Can we make it so that this is not needed?
    end

    self.current_user = authentication.user

    # TODO Does this really belong here?
    if Rails.env.development?
      # Make user admin and the checkbox was ticked
      current_user.update(admin: params[:admin].present?)
    end

    # TODO What if we were already logged in?

    redirect_to origin, notice: 'Sie haben sich erfolgreich angemeldet.'
  end

  def destroy
    self.current_user = nil

    redirect_to origin, notice: 'Sie wurden erfolgreich abgemeldet.'
  end

  def failure
    flash.now[:alert] = t(env['omniauth.error.type'], scope: :omniauth)
    render :new
  end

  private

    def origin
      params[:origin]
    end
end
