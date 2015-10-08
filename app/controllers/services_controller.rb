class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:locale] == 'en'
      @services = Service.find_en.page params[:page] 
      @service = Service.find_en.first
      @english = true
      @service_content = SiteConfig.get_config('service_content_en').value
    else
      @services = Service.find_cn.page params[:page] 
      @service = Service.find_cn.first
      @service_content = SiteConfig.get_config('service_content_cn').value
    end
    @services_bar_image = Slide.get_bar_image("services_bar_image")
    respond_with(@services)
  end

  def show
    if params[:locale] == 'en'
      @services = Service.find_en.page params[:page] 
      @english = true
    else
      @services = Service.find_cn.page params[:page] 
    end
    @services_bar_image = Slide.get_bar_image("services_bar_image")
    respond_with(@services)
  end

  def new
    @service = Service.new
    respond_with(@service)
  end

  def edit
  end

  def create
    @service = Service.new(service_params)
    @service.save
    respond_with(@service)
  end

  def update
    @service.update(service_params)
    respond_with(@service)
  end

  def destroy
    @service.destroy
    respond_with(@service)
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:title, :content)
    end
end
