class DirectoryNameCleanupPattern < ActiveRecord::Base
  attr_accessible :pattern, :priority, :replace

  default_scope order('priority DESC')

  def search
    # eval: unsafe but ok here, because the app is self hosted
    self.pattern[0] == '/' ? Regexp.new(eval(self.pattern)) : self.pattern
  end

  def gsub!(str)
    str.gsub!(self.search, self.replace)
    return str
  end

  def self.cleanup(str)
  	result = str.clone
  	DirectoryNameCleanupPattern.all.each {|cleanup_pattern| result = cleanup_pattern.gsub!(result) unless result.nil?}
  	result.squeeze(' ').strip unless result.nil?
  end
end
