class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:locale] == 'en'
      @services = Service.find_en.page params[:page] 
      @service = Service.find_en.first
    else
      @services = Service.find_cn.page params[:page] 
      @service = Service.find_cn.first
    end
    respond_with(@services)
  end

  def show
    if params[:locale] == 'en'
      @services = Service.find_en.page params[:page] 
    else
      @services = Service.find_cn.page params[:page] 
    end
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
