namespace :movies do
  #
  # usage (manual): rake movies:update_database
  # usage (auto): rake movies:update_database[auto]
  #
  desc "Search for movies"
  task :update_database, [:action] => :environment do |t, args|
    args.with_defaults(:action => "manual")
    is_auto_mode = args.action == "auto"

    sources = Source.all

    if sources.count == 0
      puts "No sources found!"
      exit 1
    end

    # clear the screen
    puts "\e[H\e[2J"
    puts "Searching for movies..."

    global_deleted_movie_ids = []

    sources.each do |source|
      puts "Scanning directory '#{source.path}' for source '#{source.name}'"
      directories = Dir.entries(source.path).select {|entry| File.directory? File.join(source.path,entry) and !(entry =='.' || entry == '..') }

      movie_id_list = []
      directories.each do |directory|

        # movie with same directory name and source was found
        movie = Movie.find_by_directory_name_and_source_id(directory, source.id)
        if ( !movie.nil? )
          movie_id_list << movie.id
          next
        end

        movie = Movie.find_by_directory_name(directory)
        # movie with same diretory name was found
        if !movie.nil?
          # clone the found movie and save it with new source id
          new_movie = movie.amoeba_dup
          new_movie.source_id = source.id
          new_movie.poster_image = open(movie.poster_url) unless movie.poster_url.nil?
          new_movie.save
          movie_id_list << new_movie.id
          puts "- cloned movie '#{movie.name}' in directory '#{directory}' from source '#{source.name}'"
          next
        end

        puts "\n\n- found new directory '#{directory}'"
        clean_name = DirectoryNameCleanupPattern::cleanup(directory)
        puts "  - searching for movie '#{clean_name}'"

        i = Imdb::Search.new(clean_name)
        imdb_movies = i.movies

        if !is_auto_mode
          puts "  - make your movie choice or enter imdb id (skip with '-')"
          imdb_movies[0..9].each_with_index do |imdb_movie, key|
            puts "    (#{key}): #{imdb_movie.title.encode("iso-8859-1")} - #{imdb_movie.url}"
          end

          choice = STDIN.gets.chomp
          next if choice == "-"
        else
          choice = ""
        end

        next if imdb_movies.size == 0

        # even search a 2nd time if we already have the movie so we get the right language
        imdb_movie = (choice.size > 1) ? Imdb::Movie.new(choice) : Imdb::Movie.new(imdb_movies[choice.to_i].id)
        next if imdb_movie.nil? || imdb_movie.title.nil?

        puts "  - your choice: #{imdb_movie.title.encode("iso-8859-1")}"
        movie = Movie::create_from_imdb(imdb_movie)
        movie.directory_name = directory
        movie.source = source
        movie.save
        movie_id_list << movie.id
      end

      # get the ids of all available movies
      all_movie_ids = Movie.find_all_by_source_id(source.id).map(&:id)

      # get all ids of movies that were removed from the filesystem (or were moved)
      deleted_movie_ids = all_movie_ids - movie_id_list
      global_deleted_movie_ids += deleted_movie_ids
    end

    # remove all movies that were removed from the filesystem
    global_deleted_movie_ids.each do |movie_id|
      movie = Movie.find_by_id(movie_id)
      puts "- removing deleted movie '#{movie.name}' from database"
      movie.destroy
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

  #
  # usage: rake movies:fetch_missing_images
  #
  desc "Fetching all missing images"
  task :fetch_missing_images => :environment do |t, args|
    movies = Movie.all

    if movies.count == 0
      puts "No movies found!"
      exit 1
    end

    puts "Fetching all missing images..."

    movies.each do |movie|
      next if movie.poster_image.exists?
      next if !movie.poster_url

      puts "Updating poster image of movie '#{movie.name}'"
      movie.poster_image = open(movie.poster_url)
      movie.save
    end
  end
end
