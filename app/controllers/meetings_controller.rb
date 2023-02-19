class MeetingsController < ApplicationController
  respond_to :json

  def index
    render json: next_meeting.to_json
  end

  def new; end

  def edit; end

  def create; end

  def update; end
end
