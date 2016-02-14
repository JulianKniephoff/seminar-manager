class AddLikesCountToTopics < ActiveRecord::Migration
  def up
    add_column :topics, :likes_count, :integer

    Topic.all.each do |topic|
      Topic.reset_counters(topic.id, :likes)
    end
  end

  def down
    remove_column :topics, :likes_count
  end
end
