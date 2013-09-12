class Movie < ActiveRecord::Base
  attr_accessible :imdb_id, :directory_name, :source_id, :length, :name, :plot, :plot_summary, :plot_synopsis
  attr_accessible :poster_url, :rating, :tagline, :trailer_url, :votes, :year

  belongs_to :source
  has_many :movie_genre_assignments, :dependent => :destroy
  has_many :genres, :through => :movie_genre_assignments

  validates :name,
    :presence => true

  def full_path
    "#{self.source.path}/#{self.directory_name}"
  end

  def youtube_trailer_url
    "http://www.youtube.com/results?search_query=#{URI::encode(self.name)}+trailer"
  end

  def self.cleanup_directory_name(str)
    replacements = [
      [/DVDRip/i, ""],
      [/XviD/i, ""],
      [/WRD/, ""],
      [/UPA/, ""],
      [/morgie/, ""],
      [/aXXo/, ""],
      [/DiAMOND/, ""],
      [/AXED/, ""],
      [/BRRip/i, ""],
      [/BDRip/i, ""],
      [/SCREAM/, ""],
      [/720\w/i, ""],
      [/1080\w/i, ""],
      [/CD/i, ""],
      [/DVDSCR/i, ""],
      [/DVD/i, ""],
      [/R5/, ""],
      [/MP3/i, ""],
      [/HDSi/i, ""],
      [/UNRATED/i, ""],
      [/CoWRY/i, ""],
      [/2Lions/i, ""],
      [/E.Sub/i, ""],
      [/www.mastitorrents.com/i, ""],
      [/torrents/i, ""],
      [/GCJM/i, ""],
      [/dual audio/i, ""],
      [/_sujaidr/i, ""],
      [/Directors Cut/i, ""],
      [/~/, ""],
      [/ Rip/i, ""],
      [/x264/i, ""],
      [/h264/i, ""],
      [/AC3/i, ""],
      [/AAC/i, ""],
      [/ aka /i, " "],
      [/HDRiP/i, ""],
      [/subtitle\w*/i, ""],
      [/-[\w]+$/, ""],
      [/-/, " "],
      [/\./, " "],
      # year numbers in brakets
      [/\[([\d]{4})\]/, ' \1'],
      # skil all other stuff in brankets
      [/\[.*\]/, ""],
      [/AC3-ViSiON/i, ""],
    ]
    result = str.clone
  	replacements.each {|replacement| result.gsub!(replacement[0], replacement[1])}

  	result.squeeze(' ').strip
  end

  def update_with_imdb
    i = Imdb::Movie.new(self.imdb_id)
    self.update_from_imdb(i)
    self.save
  end

  def update_from_imdb(i)
    self.imdb_id = i.id
    self.length = i.length
    self.name = i.title
    self.plot = i.plot
    self.plot_summary = i.plot_summary
    self.plot_synopsis = i.plot_synopsis
    self.poster_url = i.poster
    self.rating = i.rating
    self.tagline = i.tagline
    self.trailer_url = i.trailer_url
    self.votes = i.votes
    self.year = i.year
    self.save

    # creating and assigning genres
    i.genres.each do |text|
      genre = Genre.find_or_create_by_name(text)
      movie_genre_assignment = MovieGenreAssignment.find_or_create_by_movie_id_and_genre_id(self.id, genre.id)
    end
  end

  def self.create_from_imdb(i)
    movie = Movie.new
    movie.update_from_imdb(i)
    movie
  end
end
