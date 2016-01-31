Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer
  provider :ldap,
           host: 'ldap.uni-osnabrueck.de',
           port: 389,
           base: 'ou=people, dc=uni-osnabrueck, dc=de',
           uid: 'uid',
           method: :tls,
           bind_dn: '%{uid}=%{username}, %{base}',
           password: '%{password}',
           name_proc: ->(name) { name.gsub(/@.*$/, '') }

  on_failure do |env|
    # TODO This does not belong here, logically
    # Shouldn't we use something like
    #     OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    # See also the routes.rb
    SessionsController.action(:failure).call(env)
  end
end
