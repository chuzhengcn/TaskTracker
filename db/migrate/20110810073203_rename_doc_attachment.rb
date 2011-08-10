class RenameDocAttachment < ActiveRecord::Migration
  def self.up
    rename_column :attachments,:doc_file_name,:document_file_name
    rename_column :attachments,:doc_content_type,:document_content_type
    rename_column :attachments,:doc_file_size,:document_file_size
    rename_column :attachments,:doc_updated_at,:document_updated_at
  end

  def self.down
    rename_column :attachments,:document_file_name,:doc_file_name
    rename_column :attachments,:document_content_type,:doc_content_type
    rename_column :attachments,:document_file_size,:doc_file_size
    rename_column :attachments,:document_updated_at,:doc_updated_at
  end
end
