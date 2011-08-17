class AddStateIdToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :state_id,:integer
  end

  def self.down
    remove_column :tasks,:state_id
  end
end
