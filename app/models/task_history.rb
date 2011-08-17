class TaskHistory < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  belongs_to :state
  has_many :attachments,:dependent => :destroy
  accepts_nested_attributes_for :attachments 
  validates_presence_of :content,:message => "内容不能为空"
  default_scope order('created_at DESC')  
end
