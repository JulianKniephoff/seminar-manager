class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.references :speaker, index: true  #, foreign_key: true
      t.date :date

      t.timestamps null: false
    end

    add_foreign_key :talks, :users, column: :speaker_id
  end
end
