class User < ActiveRecord::Base
  has_many :task_user_ships,:dependent => :destroy
  has_many :tasks,:through => :task_user_ships
  belongs_to :department
  validates :name,:presence => true
  validates_uniqueness_of :bind_ip
end

