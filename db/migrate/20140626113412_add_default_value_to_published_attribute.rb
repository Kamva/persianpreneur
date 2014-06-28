class AddDefaultValueToPublishedAttribute < ActiveRecord::Migration
  def up
  	change_column :people, :published, :boolean, :default => false
  end
  def down
  	change_column :people, :published, :boolean, :default => nil
  end
end
