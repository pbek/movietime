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

        puts "\n\n- found new directory '#{directory}'"
        clean_name = DirectoryNameCleanupPattern::cleanup(directory)
        puts "  - searching for movie '#{clean_name}'"

        i = Imdb::Search.new(clean_name)
        imdb_movies = i.movies
        puts "  - make your movie choice or enter imdb id (skip with '-')"
        imdb_movies[0..9].each_with_index do |imdb_movie, key|
          puts "    (#{key}): #{imdb_movie.title.encode("iso-8859-1")} - #{imdb_movie.url}"
        end

        choice = STDIN.gets.chomp
        next if choice == "-"

        # even search a 2nd time if we already have the movie so we get the right language
        imdb_movie = (choice.size > 1) ? Imdb::Movie.new(choice) : Imdb::Movie.new(imdb_movies[choice.to_i].id)
        next if imdb_movie.nil? || imdb_movie.title.nil?

        puts "  - your choice: #{imdb_movie.title.encode("iso-8859-1")}"
        movie = Movie::create_from_imdb(imdb_movie)
        movie.directory_name = directory
        movie.source = source
        movie.save
      end
    end
  end

  #
  # usage: rake movies:update_with_imdb
  #
  desc "Update all movies with imdb"
  task :update_with_imdb => :environment do |t, args|
    movies = Movie.all

    if movies.count == 0
      puts "No movies found!"
      exit 1
    end

    puts "Updating movies with imdb..."

    movies.each do |movie|
      next if movie.imdb_id == "" || movie.nil?
      puts "Updating movie '#{movie.name}' with imdb id '#{movie.imdb_id}'"
      movie.update_with_imdb
    end
  end
end
