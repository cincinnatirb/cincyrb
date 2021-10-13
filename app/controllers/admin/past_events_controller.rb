module Admin
  class PastEventsController < AdminController
    def index; end

    private

    def past_event_params
      params.require(:past_event).permit()
    end
  end
end
