class AddImageToSocials < ActiveRecord::Migration[7.0]
  def change
    add_column :socials, :image, :string
  end
end
