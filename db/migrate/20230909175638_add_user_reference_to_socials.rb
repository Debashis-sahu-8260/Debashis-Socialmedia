class AddUserReferenceToSocials < ActiveRecord::Migration[7.0]
  def change
    add_reference :socials, :user, null: false, foreign_key: true
  end
end
