class User < ActiveRecord::Base
  has_many :likes

  # TODO Should this live here or in Idea?
  # TODO Also the naming is confusing, considering Idea#like ...
  def like(idea)
    likes.where(idea: idea).first
  end

  # TODO Redundant?
  def likes?(idea)
    # TODO Does not work
    likes.map(&:idea_id).include?(idea.id)
  end
end
