class AddHandDigginTextToPermits < ActiveRecord::Migration[5.2]
  def change
    add_column :permits, :hand_diggin_text, :text
  end
end
