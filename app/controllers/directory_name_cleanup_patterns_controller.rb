class DirectoryNameCleanupPatternsController < ApplicationController
  # GET /directory_name_cleanup_patterns
  # GET /directory_name_cleanup_patterns.json
  def index
    @directory_name_cleanup_patterns = DirectoryNameCleanupPattern.all

    # puts DirectoryNameCleanupPattern::clean("A Film XVid").inspect

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @directory_name_cleanup_patterns }
    end
  end

  # GET /directory_name_cleanup_patterns/1
  # GET /directory_name_cleanup_patterns/1.json
  def show
    @directory_name_cleanup_pattern = DirectoryNameCleanupPattern.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @directory_name_cleanup_pattern }
    end
  end

  # GET /directory_name_cleanup_patterns/new
  # GET /directory_name_cleanup_patterns/new.json
  def new
    @directory_name_cleanup_pattern = DirectoryNameCleanupPattern.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @directory_name_cleanup_pattern }
    end
  end

  # GET /directory_name_cleanup_patterns/1/edit
  def edit
    @directory_name_cleanup_pattern = DirectoryNameCleanupPattern.find(params[:id])
  end

  # POST /directory_name_cleanup_patterns
  # POST /directory_name_cleanup_patterns.json
  def create
    @directory_name_cleanup_pattern = DirectoryNameCleanupPattern.new(params[:directory_name_cleanup_pattern])

    respond_to do |format|
      if @directory_name_cleanup_pattern.save
        format.html { redirect_to @directory_name_cleanup_pattern, notice: 'Directory name cleanup pattern was successfully created.' }
        format.json { render json: @directory_name_cleanup_pattern, status: :created, location: @directory_name_cleanup_pattern }
      else
        format.html { render action: "new" }
        format.json { render json: @directory_name_cleanup_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /directory_name_cleanup_patterns/1
  # PUT /directory_name_cleanup_patterns/1.json
  def update
    @directory_name_cleanup_pattern = DirectoryNameCleanupPattern.find(params[:id])

    respond_to do |format|
      if @directory_name_cleanup_pattern.update_attributes(params[:directory_name_cleanup_pattern])
        format.html { redirect_to @directory_name_cleanup_pattern, notice: 'Directory name cleanup pattern was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @directory_name_cleanup_pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directory_name_cleanup_patterns/1
  # DELETE /directory_name_cleanup_patterns/1.json
  def destroy
    @directory_name_cleanup_pattern = DirectoryNameCleanupPattern.find(params[:id])
    @directory_name_cleanup_pattern.destroy

    respond_to do |format|
      format.html { redirect_to directory_name_cleanup_patterns_url }
      format.json { head :no_content }
    end
  end
end
