class Cpanel::FrontController < Cpanel::ApplicationController
  def index
    @news = News.new
    @activity = Activity.new

    @slides_count = Slide.all.count
    @news_count = News.all.count
    @activities_count = Activity.all.count
    @services_count = Service.all.count
  end

  # def about
  #   @cpanel_site_about = SiteConfig.about_title
  # end

  def dashboard
  end

  def about
    @about_en = SiteConfig.where(key: 'about_en').first
    @about_cn = SiteConfig.where(key: 'about_cn').first
    @about_abstract_en = SiteConfig.get_config('about_abstract_en')
    @about_abstract_cn = SiteConfig.get_config('about_abstract_cn')
  end

  def contact_us
    @contact_cn = SiteConfig.where(key: 'contact_cn').first
    @contact_en = SiteConfig.where(key: 'contact_en').first
  end

  def glossaries
    @glossaries = SiteConfig.get_config('glossaries')
  end
end
