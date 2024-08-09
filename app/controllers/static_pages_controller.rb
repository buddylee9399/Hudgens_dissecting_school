class StaticPagesController < ApplicationController
  def index
    if current_user
      @guides = UserFeed
                  .new(current_user)
                  .call
                  .page(params[:page])
                  .per(20)
                  .includes([:user, :topic, featured_image_attachment: :blob])
    else
      @guides = Guide
                  .ordered
                  .page(params[:page])
                  .per(20)
                  .includes([:user, :topic, featured_image_attachment: :blob])
    end    
  end

  def about
  end

  def contact
  end

  def privacy
  end
end
