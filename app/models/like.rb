class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea, inverse_of: :likes
end
