class Cpanel::FrontController < Cpanel::ApplicationController
  def index
    @news = News.new
    @activity = Activity.new

    @slides_count = Slide.shows.all.count
    @news_count = News.all.count
    @activities_count = Activity.all.count
    @services_count = Service.all.count

    # @about_bar_image = Picture.get_image("about_bar_image")
    @about_bar_image = Slide.get_bar_image("about_bar_image")
    @services_bar_image = Slide.get_bar_image("services_bar_image")
    @news_bar_image = Slide.get_bar_image("news_bar_image")
    @activity_bar_image = Slide.get_bar_image("activity_bar_image")
    @position_bar_image = Slide.get_bar_image("position_bar_image")
    @glossary_image = Slide.get_bar_image("glossary_bar_image")

    # 从Positions controller 挪到cpanel index
    @position_abstract_en = SiteConfig.get_config('position_abstract_en')
    @position_abstract_cn = SiteConfig.get_config('position_abstract_cn')

    # 从Services controller 挪到cpanel index
    @service_abstract_en = SiteConfig.get_config('service_abstract_en')
    @service_abstract_cn = SiteConfig.get_config('service_abstract_cn')

    #从Cpanel about里面挪到 cpanel index
    @about_abstract_cn = SiteConfig.get_config('about_abstract_cn')
    @about_abstract_en = SiteConfig.get_config('about_abstract_en')
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
