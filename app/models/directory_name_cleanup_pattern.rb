class DirectoryNameCleanupPattern < ActiveRecord::Base
  attr_accessible :pattern, :priority, :replace

  default_scope order('priority DESC')

  def search
  	self.pattern[0] == '/' ? eval(self.pattern) : self.pattern
  end

  def gsub!(str)
  	puts self.pattern
  	puts self.search
  	str.gsub!(self.search, self.replace)
  end

  def self.clean(str)
  	result = str.clone
  	puts result
  	DirectoryNameCleanupPattern.all.each {|cleanup_pattern| puts result = cleanup_pattern.gsub!(result) unless result.nil?}
  	result.squeeze(' ').strip unless result.nil?
  end
end
