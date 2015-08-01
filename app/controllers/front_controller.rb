class FrontController < ApplicationController
  def index
    @slides = Slide.all

    @about_image = Picture.where(:key => "about_image").first
    @news_image = Picture.where(:key => "about_image").first
    @activity_image = Picture.where(:key => "activity_image").first

    if params[:locale] == 'zh-CN'
      @about_locale = SiteConfig.about_cn
    else
      @about_locale = SiteConfig.about_en
    end

    @front_news = News.all.limit(5)
    @front_activites = Activity.all.limit(5)

    @partner_urls = Partner.all
  end

  def about
    @about_en = SiteConfig.about_en
    @about_cn = SiteConfig.about_cn
    @site_logo = SiteConfig.site_logo
    @about_image = Picture.where(:key => "about_image").first
  end

  def contact_us
    @contact_cn = SiteConfig.contact_cn
    @contact_en = SiteConfig.contact_en
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
