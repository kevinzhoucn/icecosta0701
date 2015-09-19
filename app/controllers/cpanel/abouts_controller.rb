class Cpanel::AboutsController < Cpanel::ApplicationController
  before_action :set_about, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @abouts = About.all
    respond_with(@abouts)
  end

  def show
    respond_with(@about)
  end

  def new
    @about = About.new
    # redirect_to cpanel_abouts_path
    respond_with(@about)
  end

  def edit
  end

  def create
    @about = About.new(about_params)
    @about.save
    redirect_to cpanel_abouts_path
    # respond_with(@about)
  end

  def update
    @about.update(about_params)
    redirect_to cpanel_abouts_path
    # respond_with(@about)
  end

  def destroy
    @about.destroy
    redirect_to cpanel_abouts_path
    # respond_with(@about)
  end

  private
    def set_about
      @about = About.find(params[:id])
    end

    def about_params
      params.require(:about).permit(:title, :content, :lang)
    end
end
