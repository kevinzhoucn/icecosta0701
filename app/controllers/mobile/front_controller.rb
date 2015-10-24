class Mobile::FrontController < Mobile::ApplicationController
  def index
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

  def activities
    @items = Activity.all.page params[:page]
  end

  def positions
    @items = Position.all.page params[:page]
  end
end