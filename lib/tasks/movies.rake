namespace :movies do
  #
  # usage: rake movies:update_database
  #
  desc "Search for movies"
  task :update_database => :environment do |t, args|
    sources = Source.all

    if sources.count == 0
      puts "No sources found!"
      exit 1
    end

    puts "Searching for movies..."

    sources.each do |source|
      puts "  Scanning directory '#{source.path}' for source '#{source.name}'"
    end
  end
end
