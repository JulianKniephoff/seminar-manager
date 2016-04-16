class Material < ActiveRecord::Base
  validates :description, presence: true
end
