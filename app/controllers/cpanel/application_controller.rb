class Cpanel::ApplicationController < ActionController::Base
  layout 'cpanel'
  protect_from_forgery with: :exception
  
  #before_filter :authenticate_user!, :set_params

  def set_params
    @site_maintenace_notice = SiteConfig.get_config('maintenance_notice')
  end
end
