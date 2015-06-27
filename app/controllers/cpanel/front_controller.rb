class Cpanel::FrontController < Cpanel::ApplicationController
  def index
  end

  def about
    @cpanel_site_about = SiteConfig.about_title
  end
end
