class Movie < ActiveRecord::Base
  attr_accessible :imdb_id, :directory_name, :source_id, :length, :name, :plot, :plot_summary, :plot_synopsis
  attr_accessible :poster_url, :rating, :tagline, :trailer_url, :votes, :year, :director_id
  has_attached_file :poster_image, :styles => { :fullscreen => "1280x1280>", :small => "113x160>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :poster_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :source
  belongs_to :director

  has_many :movie_genre_assignments, :dependent => :destroy
  has_many :genres, :through => :movie_genre_assignments

  has_many :movie_cast_member_assignments, :dependent => :destroy
  has_many :cast_members, :through => :movie_cast_member_assignments

  validates :name,
    :presence => true

  amoeba do
    enable
  end

  def full_path
    "#{self.source.path}/#{self.directory_name}"
  end

  def youtube_trailer_url
    "http://www.youtube.com/results?search_query=#{URI::encode(self.name)}+trailer"
  end

  def imdb_url
    "http://www.imdb.com/title/tt#{self.imdb_id}"
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
    self.poster_image = open(i.poster)
    self.rating = i.rating
    self.tagline = i.tagline
    self.trailer_url = i.trailer_url
    self.votes = i.votes
    self.year = i.year
    self.save

    # remove old movie_genre_assignments
    self.movie_genre_assignments.each do |movie_genre_assignment|
      movie_genre_assignment.delete
    end

    # creating and assigning genres
    i.genres.each do |text|
      genre = Genre.find_or_create_by_name(text)
      MovieGenreAssignment.find_or_create_by_movie_id_and_genre_id(self.id, genre.id)
    end

    # remove old movie_cast_member_assignments
    self.movie_cast_member_assignments.each do |movie_cast_member_assignment|
      movie_cast_member_assignment.delete
    end

    # creating and assigning cast members
    i.cast_members.each do |text|
      cast_member = CastMember.find_or_create_by_name(text)
      MovieCastMemberAssignment.find_or_create_by_movie_id_and_cast_member_id(self.id, cast_member.id)
    end

    # creating and assigning director
    self.director = Director.find_or_create_by_name(i.director[0])
  end

  def self.create_from_imdb(i)
    movie = Movie.new
    movie.update_from_imdb(i)
    movie
  end
end
