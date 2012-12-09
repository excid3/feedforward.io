class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all

    respond_to do |format|
      format.html
      format.json { render json: @podcasts }
      format.rss
    end
  end
end
