class AddUserTypesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :approver, :boolean, default: false
    add_column :users, :author, :boolean, default: false
  end
end
