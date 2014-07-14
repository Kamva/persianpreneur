class AddLinkedinProfileToPeople < ActiveRecord::Migration
  def change
    add_column :people, :linkedin_profile, :string
  end
end
