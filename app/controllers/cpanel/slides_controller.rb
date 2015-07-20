class Cpanel::SlidesController < Cpanel::ApplicationController
  before_action :set_slide, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @slides = Slide.all
    respond_with(@slides)
  end

  def show
    respond_with(@slide)
  end

  def new
    @slide = Slide.new
    respond_with(@slide)
  end

  def edit
  end

  def create
    @slide = Slide.new(slide_params)
    @slide.save
    redirect_to cpanel_slides_path
    # respond_with(@slide)
  end

  def update
    @slide.update(slide_params)
    redirect_to cpanel_slides_path
    # respond_with(@slide)
  end

  def destroy
    @slide.destroy
    redirect_to cpanel_slides_path
    # respond_with(@slide)
  end

  private
    def set_slide
      @slide = Slide.find(params[:id])
    end

    def slide_params
      params.require(:slide).permit(:title, :sub_title, :avatar)
    end
end
