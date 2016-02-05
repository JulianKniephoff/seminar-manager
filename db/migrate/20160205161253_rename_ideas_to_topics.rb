class RenameIdeasToTopics < ActiveRecord::Migration
  def change
    rename_table :ideas, :topics

    rename_column :comments, :idea_id, :topic_id
    rename_column :likes, :idea_id, :topic_id
  end
end
