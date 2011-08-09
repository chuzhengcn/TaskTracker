class AddUserIdToHistory < ActiveRecord::Migration
  def self.up
    add_column :task_histories,:user_id,:integer
  end

  def self.down
    remove_column :task_histories,:user_id
  end
end
