class FrontController < ApplicationController
  def index
    @slides = Slide.all
  end

  def about
    @about_en = SiteConfig.about_en
    @about_cn = SiteConfig.about_cn
    @site_logo = SiteConfig.site_logo
  end

  def contact_us
    @contact_us = SiteConfig.contact_us
  end
end
