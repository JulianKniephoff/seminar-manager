class Talk < ActiveRecord::Base
  belongs_to :speaker,
             class_naem: 'User'
end
