class AddSiteLayoutImgToPermits < ActiveRecord::Migration[5.2]
  def change
    add_column :permits, :site_layout_img, :string
  end
end
