class Topic < ActiveRecord::Base
  belongs_to :author,
             class_name: 'User'

  has_many :comments
  has_many :likes,
           inverse_of: :topic

  has_and_belongs_to_many :talks

  validates :title,
            uniqueness: { case_sensitive: false },
            presence: true
  validates :description,
            presence: true

  # TODO Put this on the user?
  # Makes for more readable expressions like `user.like(topic)`
  def like(user)
    likes.create(user: user)
  end
end
