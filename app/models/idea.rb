class Idea < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  validates :title, uniqueness: true
end
