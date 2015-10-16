class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout
  before_filter :set_locale, :set_services

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  private
    def layout
      # is_a?(Devise::SessionsController) ? "applogin" : "application"
      # devise_controller? || "application"

      layout_str = "application"
      layout_str = "applogin" if devise_controller?
      layout_str = "app_maintenance" if SiteConfig.maintenance.to_s =~ /(.*)on(.*)/
      # layout_str = "app_maintenance" if true
    end

    def set_locale  
      I18n.locale = params[:locale] || I18n.default_locale        
    end

    def set_services
      if params[:locale] == 'en'
        @services = Service.find_en.page params[:page] 
        @abouts = About.find_en
        @english = true
      else
        @services = Service.find_cn.page params[:page] 
        @abouts = About.find_cn
      end
    end
end
