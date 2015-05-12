class FixColumnUser < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    change_table :users do |t|
      t.rename :skills, :moreskills
    end
  end
end
