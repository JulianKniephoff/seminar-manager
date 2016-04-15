class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :description
      t.references :talk

      t.timestamps null: false
    end
  end
end
