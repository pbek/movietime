class DirectoryNameCleanupPattern < ActiveRecord::Base
  attr_accessible :pattern, :priority, :replace
end
