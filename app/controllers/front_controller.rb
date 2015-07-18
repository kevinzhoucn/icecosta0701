class FrontController < ApplicationController
  def index
    @slides = Slide.all

    @about_image = Picture.where(:key => "about_image").first
    @news_image = Picture.where(:key => "about_image").first
    @activity_image = Picture.where(:key => "activity_image").first


    @about_cn = SiteConfig.about_cn

    @front_news = News.all.limit(5)
    @front_activites = Activity.all.limit(5)

    @partner_urls = Partner.all


  end

  def about
    @about_en = SiteConfig.about_en
    @about_cn = SiteConfig.about_cn
    @site_logo = SiteConfig.site_logo
  end

  def contact_us
    @contact_cn = SiteConfig.contact_cn
    @contact_en = SiteConfig.contact_en
  end
end
