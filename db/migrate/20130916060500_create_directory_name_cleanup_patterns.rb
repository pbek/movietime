class CreateDirectoryNameCleanupPatterns < ActiveRecord::Migration
  def change
    create_table :directory_name_cleanup_patterns do |t|
      t.string :pattern
      t.string :replace
      t.integer :priority

      t.timestamps
    end
  end
end
