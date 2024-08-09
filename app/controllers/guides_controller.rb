class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /guides
  def index
    # @guides = Guide.all
    @guides = Guide.ordered.page(params[:page]).per(20).includes([:user, :topic, featured_image_attachment: :blob])
  end

  # GET /guides/1
  def show
    @page_title = @guide.title
  end

  # GET /guides/new
  def new
    @guide = Guide.new
  end

  # GET /guides/1/edit
  def edit
  end

  # POST /guides
  def create
    # @guide = Guide.new(guide_params)
    @guide = current_user.guides.build(guide_params)

    if @guide.save
      redirect_to @guide, notice: 'Guide was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /guides/1
  def update
    if @guide.update(guide_params)
      redirect_to @guide, notice: 'Guide was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /guides/1
  def destroy
    @guide.destroy
    redirect_to guides_url, notice: 'Guide was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = Guide.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def guide_params
      params.require(:guide).permit(
        :title, 
        :content, 
        :topic_id, 
        :status, 
        :live_updates, 
        :featured_image)
    end
end
