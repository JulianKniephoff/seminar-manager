class Like < ActiveRecord::Base
  belongs_to :user,
             inverse_of: :likes
  belongs_to :topic,
             inverse_of: :likes,
             counter_cache: true

  validates :user,
            uniqueness: { scope: :topic }
end
