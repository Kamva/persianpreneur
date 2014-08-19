class RenameArrangementInPeople < ActiveRecord::Migration
  def up
  	rename_column :people, :arrangement, :position
  end
  def down
  	rename_column :people, :position, :arrangement
  end
end
