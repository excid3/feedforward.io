class PodcastsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @podcasts = Podcast.order("created_at DESC")

    respond_to do |format|
      format.html
      format.json { render json: @podcasts }
      format.rss
    end
  end

  def show
    @podcast = Podcast.find params[:id]
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new params[:podcast]

    if @podcast.save
      redirect_to podcasts_path, notice: "Podcast was successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @podcast = Podcast.find params[:id]
  end

  def update
    @podcast = Podcast.find params[:id]

    if @podcast.update_attributes params[:podcast]
      redirect_to podcasts_path, notice: "Podcast was successfully created."
    else
      render action: "edit"
    end
  end

  def destroy
    @podcast = Podcast.find(params[:id])
    @podcast.destroy

    redirect_to links_url, notice: "Podcast was successfully removed."
  end
end
