class Attachment < ActiveRecord::Base
  belongs_to :task
  belongs_to :task_history
  has_attached_file :pic
  has_attached_file :document
  #validates_attachment_content_type :document, :content_type => 'image/png'  
end
