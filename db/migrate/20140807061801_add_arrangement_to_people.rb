class AddArrangementToPeople < ActiveRecord::Migration
  def change
    add_column :people, :arrangement, :integer
  end
end
