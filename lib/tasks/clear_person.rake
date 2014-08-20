namespace :db do
	namespace :person do
		desc "Clears People table"
		task :clear => :environment do
			puts "Clearing out People table..."
			Person.destroy_all
			puts "People table cleared out successfully".green
		end
	end
end