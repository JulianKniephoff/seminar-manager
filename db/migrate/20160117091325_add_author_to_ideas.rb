class AddAuthorToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :author, index: true
    add_foreign_key :ideas, :users, column: :author_id
  end
end
