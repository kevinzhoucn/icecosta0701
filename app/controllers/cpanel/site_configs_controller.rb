class Cpanel::SiteConfigsController < Cpanel::ApplicationController
  before_action :set_cpanel_site_config, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    # @cpanel_site_configs = SiteConfig.all
    @cpanel_site_configs_other = []
    # @cpanel_site_configs_other << SiteConfig.where(key: 'site_logo').first
    # @cpanel_site_configs_other << SiteConfig.where(key: 'site_slogan').first
    # site_logo 和 site_slogan暂时用不上
    @cpanel_site_configs_other << SiteConfig.where(key: 'keywords').first
    @cpanel_site_configs_other << SiteConfig.where(key: 'description').first
    respond_with(@cpanel_site_configs_other)
  end

  def show
    respond_with(@cpanel_site_config)
  end

  def new
    @cpanel_site_config = SiteConfig.new
    respond_with(@cpanel_site_config)
  end

  def edit
  end

  def create
    @cpanel_site_config = SiteConfig.new(cpanel_site_config_params)
    @cpanel_site_config.save
    respond_with(@cpanel_site_config)
  end

  def update
    @cpanel_site_config.update(cpanel_site_config_params)
    respond_with(@cpanel_site_config, location: cpanel_site_config_path)
  end

  def destroy
    @cpanel_site_config.destroy
    respond_with(@cpanel_site_config)
  end

  private
    def set_cpanel_site_config
      @cpanel_site_config = SiteConfig.find(params[:id])
    end

    def cpanel_site_config_params
      params.require(:site_config).permit(:key, :value)
    end
end
