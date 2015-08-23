class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # layout :layout
  before_filter :set_locale

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  private
    def layout
      # is_a?(Devise::SessionsController) ? "applogin" : "application"
      # devise_controller? || "application"
      if devise_controller?
        "applogin"
      else
        "application"
      end
    end

    def set_locale  
      I18n.locale = params[:locale] || I18n.default_locale  
    end
end
