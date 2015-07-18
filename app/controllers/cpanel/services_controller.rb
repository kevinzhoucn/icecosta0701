class Cpanel::ServicesController < Cpanel::ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @services = Service.all
    @service = Service.first
    respond_with(@services)
  end

  def show
    @services = Service.all
    respond_with(@service)
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
    redirect_to cpanel_service_index_path
    # respond_with(@service)
  end

  def update
    @service.update(service_params)
    redirect_to cpanel_service_index_path
    # respond_with(@service)
  end

  def destroy
    @service.destroy
    redirect_to cpanel_service_index_path
    # respond_with(@service)
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:title, :content)
    end
end
