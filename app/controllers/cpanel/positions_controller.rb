class Cpanel::PositionsController < Cpanel::ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @positions = Position.all
    respond_with(@positions)
  end

  def show
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
    if @position.save
      redirect_to cpanel_positions_path
    end
    # respond_with(@position)
  end

  def update
    if @position.update(position_params)
      redirect_to cpanel_positions_path
    end
    # respond_with(@position)
  end

  def destroy
    @position.destroy
    redirect_to cpanel_positions_path
    # respond_with(@position)
  end

  private
    def set_position
      @position = Position.find(params[:id])
    end

    def position_params
      params.require(:position).permit(:title, :content, :position_type, :lang)
    end
end
