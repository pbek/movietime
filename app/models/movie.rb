class Movie < ActiveRecord::Base
  attr_accessible :imdb_id, :directory_name, :source_id, :length, :name, :plot, :plot_summary, :plot_synopsis
  attr_accessible :poster_url, :rating, :tagline, :trailer_url, :votes, :year

  belongs_to :source

  validates :name,
    :presence => true

  def full_path
    "#{self.source.path}/#{self.directory_name}"
  end

  def youtube_trailer_url
    "http://www.youtube.com/results?search_query=#{URI::encode(self.name)}+trailer"
  end

  def self.cleanupDirectoryName(str)
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

  def self.create_from_imdb(i)
    movie = Movie.new
    movie.imdb_id = i.id
    movie.length = i.length
    movie.name = i.title
    movie.plot = i.plot
    movie.plot_summary = i.plot_summary
    movie.plot_synopsis = i.plot_synopsis
    movie.poster_url = i.poster
    movie.rating = i.rating
    movie.tagline = i.tagline
    movie.trailer_url = i.trailer_url
    movie.votes = i.votes
    movie.year = i.year
    movie
  end
end
