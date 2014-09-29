class RenameBlackboardPostsToPosts < ActiveRecord::Migration
  def change
    rename_table :blackboard_posts, :posts
  end
end
