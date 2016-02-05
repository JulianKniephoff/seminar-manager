class Idea < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes, inverse_of: :idea

  validates :title, uniqueness: true

  # TODO Put this on the user?
  # Makes for more readable expressions like `user.like(idea)`
  def like(user)
    likes.create(user: user)
  end
end
