class TaskHistory < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  belongs_to :state
  default_scope order('created_at DESC')  
end
