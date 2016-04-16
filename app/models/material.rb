class Material < ActiveRecord::Base
  has_attached_file :file
  do_not_validate_attachment_file_type :file

  validates :description, presence: true
end
