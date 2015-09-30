class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @positions = Position.all
    @position_bar_image = Slide.get_bar_image("position_bar_image")
    @position_content_image = Slide.get_bar_image("position_content_image")
    respond_with(@positions)
  end
  def search
    @key_words = params[:key]
    @positions = Position.search(params[:key]).page params[:page]
    @position_bar_image = Slide.get_bar_image("position_bar_image")
    respond_with(@positions)
  end
  def show
    @position_bar_image = Slide.get_bar_image("position_bar_image")
    @position_content_image = Slide.get_bar_image("position_content_image")
    respond_with(@position)
  end

  def new
    @position = Position.new
    respond_with(@position)
  end

  def edit
  end

  def create
    @position = Position.new(position_params)
    @position.save
    respond_with(@position)
  end

  def update
    @position.update(position_params)
    respond_with(@position)
  end

  def destroy
    @position.destroy
    respond_with(@position)
  end

  private
    def set_position
      @position = Position.find(params[:id])
    end

    def position_params
      params.require(:position).permit(:title, :content, :position_type)
    end
end
