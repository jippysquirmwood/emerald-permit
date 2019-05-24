class AddTitleToPermit < ActiveRecord::Migration[5.2]
  def change
    add_column :permits, :title, :string
  end
end
