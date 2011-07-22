class AddSubmitRequirementDateTimeToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks,:submit_requirement_date,:date
  end

  def self.down
    remove_column :tasks,:submit_requirement_date
  end
end
