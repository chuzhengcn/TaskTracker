class State < ActiveRecord::Base
  has_many :tasks
  has_many :task_histories,:dependent => :destroy
  
  validates :name,:presence => true
end

