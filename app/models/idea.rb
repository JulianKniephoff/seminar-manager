class Idea < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :author_id

  validates :title, uniqueness: true
end
