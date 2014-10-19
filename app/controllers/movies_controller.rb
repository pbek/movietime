class MoviesController < ApplicationController
  # GET /movies
  # GET /movies.json
  def index
    @end_time_hour = 21
    @end_time_minute = 30

    puts params

    # fixes for select2 ajax multiselect
    unless params[:q].nil?
      unless params[:q][:director_id_in].nil?
        params[:q][:director_id_in] = params[:q][:director_id_in][0].split(",")
        params[:q][:director_id_in].map!{|item| item.gsub(/\[/, '').gsub(/\]/, '')}
      end

      unless params[:q][:cast_members_id_in].nil?
        params[:q][:cast_members_id_in] = params[:q][:cast_members_id_in][0].split(",")
        params[:q][:cast_members_id_in].map!{|item| item.gsub(/\[/, '').gsub(/\]/, '')}
      end

      unless params[:q][:end_time_hour].nil?
        @end_time_hour = params[:q][:end_time_hour].to_i
      end

      unless params[:q][:end_time_minute].nil?
        @end_time_minute = params[:q][:end_time_minute].to_i
      end
    else
      params[:q] = {"source_id_in" => [1], "s" => "created_at desc"}
    end
    
    max_length = (Date.today.to_time.to_i + @end_time_hour * 3600 + @end_time_minute * 60 - DateTime.now.to_i) / 60

    @search = Movie.where("movies.length <= ?", max_length)
    @search = @search.search(params[:q])
    @movies_all = @search.result(:distinct => true)
    @movies = @movies_all.paginate(:page => params[:page], :per_page => 15)
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies_all }
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end
end
