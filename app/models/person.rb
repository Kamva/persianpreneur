class Person < ActiveRecord::Base

	mount_uploader :profile_picture, ImageUploader, dependent: :destroy
	
	validates_presence_of :profile_picture
	validates :full_name, :presence => true, :uniqueness => true
	# validates :birth_date, :presence => true
	# validates :location, :presence => true

end