Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity

  on_failure do |env|
    # TODO This does not belong here, logically
    # Shouldn't we use something like
    #     OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    # See also the routes.rb
    SessionsController.action(:failure).call(env)
  end
end
