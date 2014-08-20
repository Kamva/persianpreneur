require 'colored'
import "#{Rails.root}/lib/tasks/import_person_helper.rb"
namespace :db do
	namespace :person do
		desc "Import person data from a tsv file"
		task :import => :environment do
			required_fields = %w(full_name profile_picture)
			file_path = "lib/tasks/data.tsv"
			file = File.open(file_path, "r")
			imported = 0 # keep track of imported persons
			file_length = %x{sed -n '=' #{file_path} | wc -l}.to_i - 1 # exclude header
			puts "Found #{file_length} #{"record".pluralize(file_length)} in the file..."
			file.drop(1).each_with_index do |row, index|
				puts "Importing " + "Record \##{index+1}".bold + "..."
				fields = row.split(/\t/)
				full_name = fields[0].tr_s('"', '').strip
				next if person_exists?(full_name)
				description      = fields[7].tr_s('"', '').strip
				profile_picture  = fields[6].tr_s('"', '').strip
				location         = fields[8].tr_s('"', '').strip
				birth_date       = fields[9].tr_s('"', '').strip
				website          = fields[3].tr_s('"', '').strip
				twitter_handle   = fields[5].tr_s('"', '').strip
				linkedin_profile = fields[4].tr_s('"', '').strip				
				required_fields.each do |f|
					next if field_empty?(f, eval(f))
				end
				puts "Person: " + "#{full_name}".bold
				person = Person.new
				puts "Downloading person's profile picture..."
				person.remote_profile_picture_url = profile_picture
				next if get_url_failed?(person.profile_picture, profile_picture)
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
					puts "Record \##{index+1} imported successfully.".green
					imported = imported + 1
				end
			end
			puts "Imported #{imported} out of #{file_length} #{"record".pluralize(file_length)}.".green
		end
	end
end