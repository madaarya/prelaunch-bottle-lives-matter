class AddUploadedSendgrid < ActiveRecord::Migration
  def change
    add_column :users, :uploaded_sendgrid, :boolean, default: false
  end
end
