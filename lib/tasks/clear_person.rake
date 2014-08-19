namespace :db do
	desc "Clears Person model"
	task :clear_person => :environment do
		puts "Clearing out the Person model ..."
		Person.destroy_all
		puts "Finished :)"
	end
end