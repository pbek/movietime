class Source < ActiveRecord::Base
  attr_accessible :description, :name, :path

  validates :name,
    :presence => true

  validates :path,
    :presence => true
end
