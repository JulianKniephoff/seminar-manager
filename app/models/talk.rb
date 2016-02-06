class Talk < ActiveRecord::Base
  belongs_to :speaker,
             class_name: 'User'

  has_and_belongs_to_many :topics
end
