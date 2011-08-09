class Attachment < ActiveRecord::Base
  belongs_to :task
  has_attached_file :pic
end
