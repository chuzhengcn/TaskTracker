class User < ActiveRecord::Base
  has_many :task_user_ships,:dependent => :destroy
  has_many :tasks,:through => :task_user_ships
  has_many :user_department_ships,:dependent => :destroy
  has_many :departments,:through => :user_department_ships
  validates :name,:presence => true
  validates_uniqueness_of :bind_ip
end

