class AddRequirePeopleColumnToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks,:require_people_name,:string
  end

  def self.down
    remove_column :tasks,:require_people_name
  end
end
