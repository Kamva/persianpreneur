class Person < ActiveRecord::Base

	mount_uploader :profile_picture, ImageUploader, dependent: :destroy

	validates :full_name, :presence => true, :uniqueness => true
	validates :location, :presence => true
	validates :description, length: {maximum: 175}

end