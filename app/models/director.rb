class Director < ActiveRecord::Base
  attr_accessible :name

  scope :finder, lambda { |q| where("name like :q", q: "%#{q}%") }

  def as_json(options)
    { id: id, text: name }
  end
end
