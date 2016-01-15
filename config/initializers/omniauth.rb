Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity

  on_failure do |env|
    # TODO This does not belong here, logically
    # Shouldn't we use something like
    #OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    # See also the routes.rb
    flash = env[ActionDispatch::Flash::KEY] ||= ActionDispatch::Flash::FlashHash.new
    flash.alert = I18n.t(env['omniauth.error.type'], scope: :omniauth)
    SessionsController.action(:new).call(env)
  end
end
