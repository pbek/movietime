class CastMembersController < ApplicationController
  # GET /cast_members
  # GET /cast_members.json
  def index
    @cast_members = CastMember.order('name').finder(params[:q]).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cast_members }
    end
  end
end
