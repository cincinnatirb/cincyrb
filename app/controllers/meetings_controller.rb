class MeetingsController < ApplicationController
  respond_to :json

  def index
    render :json => @meeting = Meeting.get_meeting('34506502').to_json
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end
end
