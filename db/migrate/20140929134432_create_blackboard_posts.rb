class CreateBlackboardPosts < ActiveRecord::Migration
  def change
    create_table :blackboard_posts do |t|
      t.text :content
      t.string :title
      t.references :user

      t.timestamps
    end
    add_index :blackboard_posts, :user_id
  end
end
