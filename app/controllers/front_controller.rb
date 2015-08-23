class FrontController < ApplicationController
  def index
    @slides = Slide.all

    @about_image = Picture.where(:key => "about_image").first
    @news_image = Picture.where(:key => "news_image").first
    @activity_image = Picture.where(:key => "activity_image").first

    if params[:locale] == 'en'
      @about_locale = SiteConfig.about_en
      @front_news = News.find_en.limit(5)
      @front_activites = Activity.find_en.limit(5)
      @about_abstract_locale = SiteConfig.get_config_value("about_abstract_en")      
    else
      @about_locale = SiteConfig.about_cn
      @front_news = News.find_cn.limit(5)
      @front_activites = Activity.find_cn.limit(5)
      @about_abstract_locale = SiteConfig.get_config_value("about_abstract_cn") 
    end

    @partner_urls = Partner.all
  end

  def about
    @about_en = SiteConfig.about_en
    @about_cn = SiteConfig.about_cn

    if params[:locale] == 'zh-CN'
      @about_locale = SiteConfig.about_cn
    else
      @about_locale = SiteConfig.about_en
    end

    @site_logo = SiteConfig.site_logo
    @about_image = Picture.where(:key => "about_image").first
  end

  def contact_us
    @contact_cn = SiteConfig.contact_cn
    @contact_en = SiteConfig.contact_en
    if params[:locale] == 'zh-CN'
      @contact_locale = SiteConfig.contact_cn
    else
      @contact_locale = SiteConfig.contact_en
    end
  end

  def site_search
    key = params[:key]
    @search_result = []
    if key
      search_items = SEARCH_ITEMS.split(',').map { |item| item.strip.capitalize }

      search_items.each do |item|
        @search_result << search(item, key)
      end
    end
  end

  def glossaries
    @glossaries = SiteConfig.get_config('glossaries')
  end

  private
    def search(item, key)
      if key
        result = eval(item).where(title: /#{key}/i)
      end
    end
end
