class Department < ActiveRecord::Base
  has_many :user_department_ships,:dependent => :destroy
  has_many :users,:through => :user_department_ships
end
