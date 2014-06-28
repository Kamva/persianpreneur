module PeopleHelper

	def person_params
		params.require(:person).permit(:full_name, :description, :investor, :entrepreneur, :website,
																	 :profile_picture, :birth_date, :location, :twitter_handle, :published)
	end

end
