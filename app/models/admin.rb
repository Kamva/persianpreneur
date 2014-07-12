class Admin < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  validates :email, :presence => true,
  									:uniqueness => true

 	validates :password, :presence => true,
 											 :length => { :minimum => 6 }, 
 											 :confirmation => true
end
