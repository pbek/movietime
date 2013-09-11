class HomeController < ApplicationController
  def index
  	redirect_to movies_url
  end
end
