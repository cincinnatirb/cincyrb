module Admin
  class PastEventsController < AdminController
    before_action :past_event, only: %i[destroy edit show update]

    def create
      @past_event = PastEvent.new(past_event_params)

      PastEvent.transaction do
        @past_event.save
        speaker_ids.each do |speaker_id|
          SpeakerAssignment.create(past_event_id: @past_event.id, speaker_id:)
        end
      end

      redirect_to admin_past_event_path(@past_event) and return if @past_event.id

      render 'new'
    end

    def destroy
      past_event.destroy

      redirect_to admin_past_events_url, notice: 'Past Event was successfully deleted.'
    end

    def edit; end

    def new
      @past_event = PastEvent.new
    end

    def index
      @past_events = PastEvent.all.order('date DESC')
    end

    def show; end

    def update
      @past_event.update(past_event_params)
      redirect_to admin_past_event_path(@past_event) and return unless @past_event.errors.any?

      render 'edit'
    end

    private

    def past_event
      @past_event = PastEvent.find(params[:id])
    end

    def past_event_params
      params.require(:past_event).permit(:date, :description, :topic, speaker_ids: [])
    end

    def speaker_ids
      params[:past_event][:speaker_ids]&.filter(&:present?)&.map(&:to_i)
    end
  end
end
