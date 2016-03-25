class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :author, index: true
      t.references :idea, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end

    add_foreign_key :comments, :users, column: :author_id
  end
end
