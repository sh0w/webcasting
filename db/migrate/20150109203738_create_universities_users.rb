class CreateUniversitiesUsers < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    create_table :universities_users do |t|
      t.integer :university_id
      t.integer :user_id
    end
  end
end
