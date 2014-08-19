require 'colored'
namespace :db do
	namespace :person do
		desc "Import person data from a tsv file"
		task :import => :environment do
			file_path = "lib/tasks/data.tsv"
			file = File.open(file_path, "r")
			index = 0 
			imported = 0 # keep track of imported persons
			file_length = %x{sed -n '=' #{file_path} | wc -l}.to_i
			puts "Found #{file_length} #{"record".pluralize(file_length)} in the file..."
			file.drop(1).each do |row|
				index = index + 1
				puts "Importing " + "Record \##{index}".bold + "..."
				fields = row.split(/\t/)
				if Person.find_by_full_name(fields[0])
					puts "Person " + "#{fields[0]}".bold + " is already in the database.".yellow
					next
				end
				full_name        = fields[0].blank? ? fields[0] : fields[0].tr_s('"', '').strip
				description      = fields[7].blank? ? fields[7] : fields[7].tr_s('"', '').strip
				profile_picture  = fields[6].blank? ? fields[6] : fields[6].tr_s('"', '').strip
				location         = fields[8].blank? ? fields[8] : fields[8].tr_s('"', '').strip
				birth_date       = fields[9].blank? ? fields[9] : fields[9].tr_s('"', '').strip
				website          = fields[3].blank? ? fields[3] : fields[3].tr_s('"', '').strip
				twitter_handle   = fields[5].blank? ? fields[5] : fields[5].tr_s('"', '').strip
				linkedin_profile = fields[4].blank? ? fields[4] : fields[4].tr_s('"', '').strip
				puts "Person: " + "#{full_name}".bold
				person = Person.new
				puts "Downloading person's profile picture..."
				person.remote_profile_picture_url = profile_picture
				if person.profile_picture.blank?
					puts "Could not download person's profile picture...".yellow
					puts "#{profile_picture}".underline
					puts "Omitted the person.".red
					next
				end
				person.full_name = full_name
				person.description = description
				person.location = location
				person.birth_date = birth_date
				person.website = website
				person.twitter_handle = twitter_handle
				person.linkedin_profile = linkedin_profile
				person.published = true
				person.position = Person.all.length + 1
				if person.save!
					puts "Record \##{index} imported successfully.".green
					imported = imported + 1
				end
			end
			puts "Imported #{imported} out of #{file_length} #{"record".pluralize(file_length)}.".green
		end
	end
end