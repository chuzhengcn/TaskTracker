class AddSomeDateTimeToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks,:submit_test_date,:date
    add_column :tasks,:submit_test_over_date,:date
    add_column :tasks,:submit_deliver_date,:date
  end

  def self.down
    remove_column :tasks,:submit_test_date
    remove_column :tasks,:submit_test_over_date
    remove_column :tasks,:submit_deliver_date
  end
end
