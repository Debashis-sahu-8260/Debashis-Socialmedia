class AddTitleAndCustomColumnToSocials < ActiveRecord::Migration[7.0]
  def change
    add_column :socials, :title, :string
    add_column :socials, :content, :text
  end
end
