class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :full_name
      t.text :description
      t.boolean :investor
      t.boolean :entrepreneur
      t.string :website
      t.string :profile_picture
      t.date :birth_date
      t.string :location
      t.string :twitter_handle
      t.boolean :published

      t.timestamps
    end
  end
end
