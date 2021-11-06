module Admin
  class VideosController < AdminController
    before_action :video, only: %i[destroy edit show update]

    def create
      @video = Video.new(video_params)
      @video.save

      redirect_to admin_video_path(@video) and return if @video.id

      render 'new'
    end

    def destroy
      video.destroy

      redirect_to admin_videos_url, notice: 'Video was successfully deleted.'
    end

    def edit; end

    def new
      @video = Video.new
    end

    def index
      @videos = Video.all
    end

    def show; end

    def update
      @video.update(video_params)
      redirect_to admin_video_path(@video) and return unless @video.errors.any?

      render 'edit'
    end

    private

    def video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(%i[url past_event_id])
    end
  end
end
