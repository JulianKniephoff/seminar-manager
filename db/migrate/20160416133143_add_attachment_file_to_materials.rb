class AddAttachmentFileToMaterials < ActiveRecord::Migration
  def self.up
    change_table :materials do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :materials, :file
  end
end
