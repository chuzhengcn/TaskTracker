class RemoveColumnReqirementTimeFromTask < ActiveRecord::Migration
  def self.up
    remove_column :tasks,:submit_requirement_date
  end

  def self.down
    add_column :tasks,:submit_requirement_date,:date
  end
end
