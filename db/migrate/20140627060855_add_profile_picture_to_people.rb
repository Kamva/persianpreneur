class AddProfilePictureToPeople < ActiveRecord::Migration
  def change
    add_column :people, :profile_picture, :string
  end
end
