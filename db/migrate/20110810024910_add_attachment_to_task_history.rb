class AddAttachmentToTaskHistory < ActiveRecord::Migration
  def self.up
    add_column :attachments, :task_history_id,  :integer
    add_column :attachments, :doc_file_name,    :string
    add_column :attachments, :doc_content_type, :string
    add_column :attachments, :doc_file_size,    :integer
    add_column :attachments, :doc_updated_at,   :datetime    
  end

  def self.down
    remove_column :attachments,:task_history_id
    remove_column :attachments, :doc_file_name
    remove_column :attachments, :doc_content_type
    remove_column :attachments, :doc_file_size
    remove_column :attachments, :doc_updated_at
    
  end
end
