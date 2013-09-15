class DirectorsController < ApplicationController
  # GET /directors.json
  def index
    # regular text search for ajax search in select2
    unless params[:q].nil?
      @directors = Director.order('name').finder(params[:q]).page(params[:page])
    end

    # search for multiple ids for initSelection of select2
    unless params[:ids].nil?
      @directors = Director.order('name').find(params[:ids])
    end

    respond_to do |format|
      format.json { render json: @directors }
    end
  end
end
