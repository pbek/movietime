class RenameFolderNameOfMovies < ActiveRecord::Migration
  def change
  	rename_column :movies, :folder_name, :directory_name
  end
end
