class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:locale] == 'en'
      @news = News.find_en.mobile_order.page params[:page] 
    else
      @news = News.find_cn.mobile_order.page params[:page] 
    end
    @news_bar_image = Slide.get_bar_image("news_bar_image")
    @news_content_image = Slide.get_bar_image("news_content_image")
    respond_with(@news)
  end

  def search
    @key_words = params[:key]
    @news = News.search(params[:key]).page params[:page]
    @news_bar_image = Slide.get_bar_image("news_bar_image")
    @news_content_image = Slide.get_bar_image("news_content_image")
    respond_with(@news)
  end

  def show
    @news_bar_image = Slide.get_bar_image("news_bar_image")
    @news_content_image = Slide.get_bar_image("news_content_image")
    respond_with(@news)
  end

  def new
    @news = News.new
    respond_with(@news)
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    @news.save
    respond_with(@news)
  end

  def update
    @news.update(news_params)
    respond_with(@news)
  end

  def destroy
    @news.destroy
    respond_with(@news)
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params.require(:news).permit(:title, :content, :news_type, :lang)
    end
end
