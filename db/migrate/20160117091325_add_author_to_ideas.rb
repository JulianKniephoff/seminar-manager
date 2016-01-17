class AddAuthorToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :author, index: true, foreign_key: true
  end
end
