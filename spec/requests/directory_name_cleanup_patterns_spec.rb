require 'spec_helper'

describe "DirectoryNameCleanupPatterns" do
  describe "GET /directory_name_cleanup_patterns" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get directory_name_cleanup_patterns_path
      response.status.should be(200)
    end
  end
end
