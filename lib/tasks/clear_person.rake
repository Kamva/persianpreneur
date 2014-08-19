namespace :db do
	namespace :person do
		desc "Clears Person model"
		task :clear => :environment do
			puts "Clearing out the Person model ..."
			Person.destroy_all
			puts "Person records were successfully destroyed.".green
		end
	end
end