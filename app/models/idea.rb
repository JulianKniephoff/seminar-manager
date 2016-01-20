class Idea < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes, inverse_of: :idea

  validates :title, uniqueness: true
end
