class CreateJoinTableTalkTopic < ActiveRecord::Migration
  def change
    create_join_table :talks, :topics do |t|
      t.index [:talk_id, :topic_id]
      t.index [:topic_id, :talk_id]
    end
  end
end
