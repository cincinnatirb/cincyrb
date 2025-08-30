module Admin
  class VideosController < AdminController
    before_action :video, only: %i[destroy edit show update]

    def index
      @videos = Video.all
    end

    def show; end

    def new
      @video = Video.new
    end

    def edit; end

    def create
      @video = Video.new(video_params)
      @video.save

      if @video.id
        redirect_to admin_video_path(@video), notice: 'Video was successfully created.'
        return
      end

      render 'new'
    end

    def update
      @video.update(video_params)
      unless @video.errors.any?
        redirect_to admin_video_path(@video)
        return
      end

      render 'edit'
    end

    def destroy
      video.destroy

      redirect_to admin_videos_url, notice: 'Video was successfully deleted.'
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
