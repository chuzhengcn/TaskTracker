class DropUserDepartmentShip < ActiveRecord::Migration
  def self.up
    drop_table :user_department_ships
  end

  def self.down
    create_table :user_department_ships do |t|
      t.integer :user_id
      t.integer :department_id

      t.timestamps
    end
  end
end
