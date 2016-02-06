class User < ActiveRecord::Base
  has_many :likes

  has_many :talks, foreign_key: :speaker_id

  # TODO Should this live here or in Topic?
  # TODO Also the naming is confusing, considering Topic#like ...
  def like(topic)
    likes.where(topic: topic).first
  end

  # TODO Redundant?
  def likes?(topic)
    # TODO Does not work
    likes.map(&:topic_id).include?(topic.id)
  end
end
