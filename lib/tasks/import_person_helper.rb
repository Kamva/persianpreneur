def field_empty?(field_name, field_value)
	if field_value.blank? 
		puts "Person's #{field_name} is blank.".yellow
		puts "Omitted the person.".red
		return true
	end	
	return false
end

def person_exists?(field)
	if Person.find_by_full_name(field)
		puts "Person " + "#{field}".bold + " is already in the database.".yellow
		return true
	end
	return false
end

def get_url_failed?(profile_picture, url)
	if profile_picture.blank?
		puts "Could not download person's profile picture...".yellow
		puts "#{url}".underline
		puts "Omitted the person.".red
		return true
	end
	return false
end
