class Mobile::FrontController < Mobile::ApplicationController
  def index
    @slides = Slide.shows.all

    if params[:locale] == 'en'
      @front_news = News.find_en.mobile_order.limit(5)
      @front_activities = Activity.find_en.mobile_order.limit(5)
      @front_services = Service.find_en.limit(5)
      @front_positions = Position.limit(5)
      @english = true
    else
      @front_news = News.find_cn.mobile_order.limit(5)
      @front_activities = Activity.find_cn.mobile_order.limit(5)
      @front_services = Service.find_cn.limit(5)
      @front_positions = Position.limit(5)
    end

    @partner_urls = Partner.all
  end

  def about
    if params[:locale] == 'en'
      @about_content = SiteConfig.get_config('about_content_en').value
      @abouts = About.find_en.mobile_order.page params[:page] 
      @english = true
    else
      @about_content = SiteConfig.get_config('about_content_cn').value
      @abouts = About.find_cn.mobile_order.page params[:page] 

    end
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
      @items = News.find_en.mobile_order.page params[:page]
    else
      @items = News.find_cn.mobile_order.page params[:page]
    end
  end

  def news_show    
    @item = News.find(params[:id])
  end

  def activities
    if params[:locale] == 'en'
      @items = Activity.find_en.mobile_order.page params[:page]
    else
      @items = Activity.find_cn.mobile_order.page params[:page]
    end
  end

  def activity_show
    @item = Activity.find(params[:id])
  end

  def service_show
    @item = Service.find(params[:id])
  end

  def positions
    if params[:locale] == 'en'
      @items = Position.find_en.page params[:page]
    else
      @items = Position.find_cn.page params[:page]
    end
  end

  def position_show
    @item = Position.find(params[:id])
  end

  def contact
    if params[:locale] == 'zh-CN'
      @contact_locale = SiteConfig.contact_cn
    else
      @contact_locale = SiteConfig.contact_en
    end
  end
end