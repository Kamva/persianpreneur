namespace :db do
	namespace :person do
		desc "Import person data from a tsv file"
		task :import => :environment do
			file = File.open("lib/tasks/data.tsv", "r")
			file.each do |row|
				fields = row.split(/\t/)
				next if Person.find_by_full_name(fields[0])
				full_name        = fields[0].blank? ? fields[0] : fields[0].tr_s('"', '').strip
				description      = fields[7].blank? ? fields[7] : fields[7].tr_s('"', '').strip
				profile_picture  = fields[6].blank? ? fields[6] : fields[6].tr_s('"', '').strip
				location         = fields[8].blank? ? fields[8] : fields[8].tr_s('"', '').strip
				birth_date       = fields[9].blank? ? fields[9] : fields[9].tr_s('"', '').strip
				website          = fields[3].blank? ? fields[3] : fields[3].tr_s('"', '').strip
				twitter_handle   = fields[5].blank? ? fields[5] : fields[5].tr_s('"', '').strip
				linkedin_profile = fields[4].blank? ? fields[4] : fields[4].tr_s('"', '').strip
				person = Person.new
				person.remote_profile_picture_url = profile_picture
				next if person.profile_picture.blank?
				person.full_name = full_name
				person.description = description
				person.location = location
				person.birth_date = birth_date
				person.website = website
				person.twitter_handle = twitter_handle
				person.linkedin_profile = linkedin_profile
				person.published = true
				person.position = Person.all.length + 1
				person.save!
			end
		end
	end
end