module PeopleHelper

	def person_params
		params.require(:person).permit(:full_name, :description, :investor, :entrepreneur, :website,
																	 :profile_picture, :birth_date, :location, :twitter_handle, :linkedin_profile,
																	 :published, :position, :company)
	end

end
