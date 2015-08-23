class Mobile::ApplicationController < ActionController::Base
  layout 'mobile'
  protect_from_forgery with: :exception
end
