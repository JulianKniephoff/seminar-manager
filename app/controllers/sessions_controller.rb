class SessionsController < ApplicationController
  # TODO What are the security implications of this?
  # See https://github.com/intridea/omniauth/wiki/Managing-Multiple-Providers/2174dce6c804f7c25b407859dacd75a9c0fe8ac8
  # near the end
  skip_before_filter :verify_authenticity_token, only: [:create, :failure]

  def new
  end

  def create
    authentication = Authentication.find_or_create_with_auth_hash(auth_hash)

    # TODO Do these notices make sense in context?
    # TODO This mixes computation with IO
    notice = if signed_in?
      if authentication.user == current_user
        "Dieses #{provider}-Konto ist bereits mit Ihrem Konto verknüpft."
      else # TODO We possibly steal a link to another account here
        identity.update(user: current_user)
        "Sie können sich von nun an mit diesem #{provider}-Konto anmelden."
      end
    else # TODO This could be shorter
      if authentication.user.present?
        'Sie wurden erfolgreich angemeldet.'
      else
        authentication.create_user(name: name)
        authentication.save
        'Es wurde ein neues Konto für Sie angelegt.'
      end
    end

    # TODO This is actually only necessary, when we are not signed_in?
    self.current_user = authentication.user

    # TODO Redirect to where we came from
    redirect_to root_path, notice: notice
  end

  def destroy
    self.current_user = nil

    # TODO Redirect to where we came from
    redirect_to root_path, notice: 'Sie wurden erfolgreich abgemeldet.'
  end

  def failure
    # TODO Should we know about the env here?
    @message = t(env['omniauth.error.type'], scope: :omniauth)
    render :new
  end

  private
    def auth_hash
      env['omniauth.auth']
    end

    # TODO Should we pack information about the auth_hash in here?
    # TODO Maybe we should not call this hash.
    # We can also access its values using accessors
    # plus its hashness is an implementation detail
    def provider
      # TODO Maybe we should translate :identity to something like "<seminar-manager>-Konto"
      auth_hash[:provider].humanize
    end

    def name
      auth_hash['info']['name']
    end
end
