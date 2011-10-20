class MeetingsController < Application::Controller
  respond_to :json

  def index
    @meeting = Meeting.get_meeting('34506502')
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
