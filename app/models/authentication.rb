class Authentication < ActiveRecord::Base
  belongs_to :user

  def self.find_or_create_with_auth_hash(auth_hash)
    find_or_create_by(
      uid: auth_hash['uid'],
      provider: auth_hash['provider']
    )
  end
end
