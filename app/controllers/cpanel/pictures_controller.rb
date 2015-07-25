class Cpanel::PicturesController < Cpanel::ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pictures = Picture.all
    respond_with(@pictures)
  end

  def show
    respond_with(@picture)
  end

  def new
    @picture = Picture.new
    respond_with(@picture)
  end

  def edit
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.save
    redirect_to cpanel_pictures_path
    # respond_with(@picture)
  end

  def update
    @picture.update(picture_params)
    redirect_to cpanel_pictures_path
    # respond_with(@picture)
  end

  def destroy
    @picture.destroy
    redirect_to cpanel_pictures_path
    # respond_with(@picture)
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:key, :value, :avatar)
    end
end
