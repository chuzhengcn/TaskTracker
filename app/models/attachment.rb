class Attachment < ActiveRecord::Base
  belongs_to :task
  belongs_to :task_history
  has_attached_file :pic
  has_attached_file :doc
end
