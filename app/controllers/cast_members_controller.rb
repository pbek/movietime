class CastMembersController < ApplicationController
  # GET /cast_members.json
  def index
    # regular text search for ajax search in select2
    unless params[:q].nil?
      @cast_members = CastMember.order('name').finder(params[:q]).page(params[:page])
    end

    # search for multiple ids for initSelection of select2
    unless params[:ids].nil?
      @cast_members = CastMember.order('name').find(params[:ids])
    end

    respond_to do |format|
      format.json { render json: @cast_members }
    end
  end
end
