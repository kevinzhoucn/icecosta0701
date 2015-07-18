class Cpanel::FrontController < Cpanel::ApplicationController
  def index

  end

  # def about
  #   @cpanel_site_about = SiteConfig.about_title
  # end

  def dashboard
  end

  def about
    @about_en = SiteConfig.where(key: 'about_en').first
    @about_cn = SiteConfig.where(key: 'about_cn').first
  end

  def contact_us
    @contact_cn = SiteConfig.where(key: 'contact_cn').first
    @contact_en = SiteConfig.where(key: 'contact_en').first
  end
end
