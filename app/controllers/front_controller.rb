class FrontController < ApplicationController
  def index
    @slides = Slide.all
  end

  def about
    @about = SiteConfig.about
  end

  def contact_us
    @contact_us = SiteConfig.contact_us
  end
end
