class Like < ActiveRecord::Base
  belongs_to :user, inverse_of: :likes
  belongs_to :idea, inverse_of: :likes

  validates :user, uniqueness: { scope: :idea }
end
