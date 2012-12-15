class LinksController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :go]

  # GET /links
  def index
    @links = Link.order("created_at DESC")
    @link = Link.new

    respond_to do |format|
      format.html
      format.json { render json: @links }
      format.rss
    end
  end

  # GET /links/1/go
  def go
    @link = Link.find(params[:id])
    @link_hit = LinkHit.find_or_create_by_linkable_type_and_linkable_id("Link", @link.id)
    @link_hit.increment! :count
    redirect_to @link.url
  end

  # GET /links/1
  def show
    @link = Link.find(params[:id])
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
    @link.build_podcast if @link.podcast.nil?
    @podcast = @link.podcast
  end

  # POST /links
  def create
    @link = current_user.links.new(params[:link])

    if @link.save
      redirect_to links_path, notice: 'Link was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /links/1
  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(params[:link])
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /links/1
  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to links_url, notice: "Link was successfully removed"
  end

  def title
    require 'open-uri'
    open(params[:page]) do |f|
      f.set_encoding "UTF-8"
      render text: f.read[/<title>\s*(.*)\s*<\/title>/iu, 1]
    end
  end
end
