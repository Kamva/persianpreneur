class Person < ActiveRecord::Base

	mount_uploader :profile_picture, ImageUploader

	validates_presence_of :profile_picture
	validates :full_name, :presence => true, :length => { :maximum => 50 }
	validates :description, :presence => true
	validates :website, :presence => true
	validates :location, :presence => true
	validates :twitter_handle, :presence => true

end