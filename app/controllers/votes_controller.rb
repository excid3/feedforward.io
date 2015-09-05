class VotesController < ApplicationController
  before_action :set_link
  before_action :authenticate_user!

  def create
    @link.votes.where(user: current_user).first_or_create

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @link.votes.where(user: current_user).destroy_all

    # Link doesn't have it's counter cache updated properly here
    # Maybe it's a problem with Rails?
    @link.reload

    respond_to do |format|
      format.js
    end
  end

  private

    def set_link
      @link = Link.find(params[:link_id])
    end
end
