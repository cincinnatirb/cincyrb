class MeetingsController < ApplicationController
  respond_to :json

  def index
    render json: next_meeting.to_json
  end

  def new; end

  def create; end

  def edit; end

  def update; end
end
