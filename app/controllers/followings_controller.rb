class FollowingsController < ApplicationController
  before_action :set_following, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /followings
  def index
    @followings = Following.all
  end

  # GET /followings/1
  def show
  end

  # GET /followings/new
  def new
    @following = Following.new
  end

  # GET /followings/1/edit
  def edit
  end

  # POST /followings
  def create
    @following = Following.new(following_params)

    if @following.save
      redirect_to @following, notice: 'Following was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /followings/1
  def update
    if @following.update(following_params)
      redirect_to @following, notice: 'Following was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /followings/1
  def destroy
    @following.destroy
    redirect_to followings_url, notice: 'Following was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_following
      @following = Following.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def following_params
      params.require(:following).permit(:follower_id, :followed_id)
    end
end
