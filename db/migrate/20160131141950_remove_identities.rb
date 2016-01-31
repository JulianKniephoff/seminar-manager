require_relative '20160108171058_create_identities'

class RemoveIdentities < ActiveRecord::Migration
  def change
    revert CreateIdentities
  end
end
