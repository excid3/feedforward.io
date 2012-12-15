class LinkHitsController < ApplicationController
  def show
    @link_hit = LinkHit.find_or_create_by_url(params[:url])
    @link_hit.increment! :count
    redirect_to params[:url]
  end
end
