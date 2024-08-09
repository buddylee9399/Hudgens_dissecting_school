class ProfilesController < ApplicationController
  def index
    @profiles = User.all.page(params[:page]).per(20)
  end

  def show
    @user = User.friendly.find(params[:id])
    # @user = User.friendly.where(first_name: params[:id]).first
    @guides = @user
              .guides.ordered.page(params[:page])
              .per(10)
              .includes([:topic, featured_image_attachment: :blob])
  end
end
