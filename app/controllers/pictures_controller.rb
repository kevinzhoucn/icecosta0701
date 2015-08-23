class PicturesController < ApplicationController
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
    respond_with(@picture)
  end

  def update
    @picture.update(picture_params)
    respond_with(@picture)
  end

  def destroy
    @picture.destroy
    respond_with(@picture)
  end

  def image_list
    pictures = Picture.all
    images_list = []
    image_path = '/uploads/avatar'
    if pictures.length > 1
      pictures.each do |picture|
        item = []
        # item << picture.id
        item << picture.avatar.url
        # item[:thumb] = picture.avatar.url(:thumb)
        # item[:folder] = "Picture"
        images_list << item
      end
    end

    render :json => images_list
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:key, :value, :avatar)
    end
end

item[:image] = picture.avatar.url