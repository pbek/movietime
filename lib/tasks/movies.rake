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

    # clear the screen
    puts "\e[H\e[2J"
    puts "Searching for movies..."

    sources.each do |source|
      puts "Scanning directory '#{source.path}' for source '#{source.name}'"
      directories = Dir.entries(source.path).select {|entry| File.directory? File.join(source.path,entry) and !(entry =='.' || entry == '..') }
      directories.each do |directory|
        next unless Movie.find_by_directory_name_and_source_id(directory, source.id).nil?

        puts "- found new directory '#{directory}"
        clean_name = Movie::cleanupDirectoryName(directory)
        puts "  - make your movie choice for '#{clean_name}' or enter imdb id (skip with '-')"

        i = Imdb::Search.new(clean_name)
        imdb_movies = i.movies
        imdb_movies[0..9].each_with_index do |imdb_movie, key|
          puts "    (#{key}): #{imdb_movie.title} - #{imdb_movie.url}"
        end

        choice = STDIN.gets.chomp
        next if choice == "-"

        imdb_movie = (choice.size > 1) ? Imdb::Movie.new(choice) : imdb_movies[choice.to_i]
        next if imdb_movie.nil? || imdb_movie.title.nil?

        puts "  - your choice: #{imdb_movie.title}"
        movie = Movie::create_from_imdb(imdb_movie)
        movie.directory_name = directory
        movie.source = source
        movie.save
      end
    end
  end
end
