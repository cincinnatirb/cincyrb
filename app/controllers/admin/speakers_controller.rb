module Admin
  class SpeakersController < AdminController
    before_action :speaker, only: %i[destroy edit show update]

    def create
      @speaker = Speaker.new(speaker_params)
      @speaker.save

      redirect_to admin_speaker_path(@speaker) and return if @speaker.id

      render 'new'
    end

    def destroy
      speaker.destroy

      redirect_to admin_speakers_url, notice: 'Speaker was successfully deleted.'
    end

    def edit; end

    def new
      @speaker = Speaker.new
    end

    def index
      @speakers = Speaker.all.order('name')
    end

    def show; end

    def update
      @speaker.update(speaker_params)
      redirect_to admin_speaker_path(@speaker) and return unless @speaker.errors.any?

      render 'edit'
    end

    private

    def speaker
      @speaker = Speaker.find(params[:id])
    end

    def speaker_params
      params.require(:speaker).permit(%i[bio email image_url name])
    end
  end
end
