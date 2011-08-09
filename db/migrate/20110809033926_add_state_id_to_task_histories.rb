class AddStateIdToTaskHistories < ActiveRecord::Migration
  def self.up
    add_column :task_histories,:state_id,:integer
  end

  def self.down
    remove_column :task_histories,:state_id
  end
end
