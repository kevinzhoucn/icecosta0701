class AboutsController < ApplicationController
  before_action :set_about, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index

    # if params[:locale] == 'en'
    #   @abouts = About.find_en.page params[:page] 
    #   @about = About.find_en.first
    #   @english = true
    # else
    #   @abouts = About.find_cn.page params[:page] 
    #   @about = About.find_cn.first
    # end
    @about_bar_image = Slide.get_bar_image("about_bar_image")
    if params[:locale] == 'en'
      @about_content = SiteConfig.get_config('about_content_en').value
      @abouts = About.find_en.page params[:page] 
      @english = true
    else
      @about_content = SiteConfig.get_config('about_content_cn').value
      @abouts = About.find_cn.page params[:page] 

    end
    respond_with(@abouts)
  end

  def show
    if params[:locale] == 'en'
      @abouts = About.find_en.page params[:page] 
      @english = true
    else
      @abouts = About.find_cn.page params[:page] 
    end
    @about_bar_image = Slide.get_bar_image("about_bar_image")
    respond_with(@about)
  end

  def new
    @about = About.new
    respond_with(@about)
  end

  def edit
  end

  def create
    @about = About.new(about_params)
    @about.save
    respond_with(@about)
  end

  def update
    @about.update(about_params)
    respond_with(@about)
  end

  def destroy
    @about.destroy
    respond_with(@about)
  end

  private
    def set_about
      @about = About.find(params[:id])
    end

    def about_params
      params.require(:about).permit(:title, :content, :lang)
    end
end
