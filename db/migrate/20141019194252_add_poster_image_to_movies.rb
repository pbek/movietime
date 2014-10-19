class AddPosterImageToMovies < ActiveRecord::Migration
  def change
  	add_attachment :movies, :poster_image
  end
end
