class Mobile::FrontController < Mobile::ApplicationController
  def index
    @slides = Slide.shows.all

    if params[:locale] == 'en'
      @front_news = News.find_en.limit(5)
      @front_activities = Activity.find_en.limit(5)
      @front_services = Service.find_en.limit(5)
      @front_positions = Position.limit(5)
      @english = true
    else
      @front_news = News.find_cn.limit(5)
      @front_activities = Activity.find_cn.limit(5)
      @front_services = Service.find_cn.limit(5)
      @front_positions = Position.limit(5)
    end

    @partner_urls = Partner.all
  end

  def about
    @about_en = SiteConfig.about_en
  end

  def services
    if params[:locale] == 'en'
      @items = Service.find_en.page params[:page]
    else
      @items = Service.find_cn.page params[:page]
    end
  end

  def news
    if params[:locale] == 'en'
      @items = News.find_en.page params[:page]
    else
      @items = News.find_cn.page params[:page]
    end
  end

  def news_show    
    @item = News.find(params[:id])
  end

  def activities
    if params[:locale] == 'en'
      @items = Activity.find_en.page params[:page]
    else
      @items = Activity.find_cn.page params[:page]
    end
  end

  def activity_show
    @item = Activity.find(params[:id])
  end

  def service_show
    @item = Service.find(params[:id])
  end

  def positions
    @item = Position.all.page params[:page]
  end

  def position_show
    if params[:locale] == 'en'
      @items = Position.find_en.page params[:page]
    else
      @items = Position.find_cn.page params[:page]
    end
  end

  def contact
  end
end