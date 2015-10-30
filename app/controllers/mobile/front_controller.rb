class Mobile::FrontController < Mobile::ApplicationController
  def index
    @slides = Slide.shows.all

    if params[:locale] == 'en'
      @front_news = News.find_en.limit(5)
      @front_activites = Activity.find_en.limit(5)
      @front_services = Service.find_en.limit(5)
      @front_positions = Position.limit(5)
      @english = true
    else
      @front_news = News.find_cn.limit(5)
      @front_activites = Activity.find_cn.limit(5)
      @front_services = Service.find_cn.limit(5)
      @front_positions = Position.limit(5)
    end

    @partner_urls = Partner.all
  end

  def about
    @about_en = SiteConfig.about_en
  end

  def services
    @items = Service.all.page params[:page]
  end

  def news
    @items = News.all.page params[:page]
  end

  def news_show    
    @item = News.find(params(:id))
  end

  def activities
    @items = Activity.all.page params[:page]
  end

  def positions
    @items = Position.all.page params[:page]
  end

  def contact
  end
end