class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:locale] == 'en'
      @activities = Activity.find_en.page params[:page] 
    else
      @activities = Activity.find_cn.page params[:page] 
    end
    @activity_bar_image = Slide.get_bar_image("activity_bar_image")
    respond_with(@activities)
  end

  def search
    @key_words = params[:key]
    @activities = Activity.search(params[:key]).page params[:page]
    @activity_bar_image = Slide.get_bar_image("activity_bar_image")
    respond_with(@activities)
  end
  
  def show
    respond_with(@activity)
    @activity_bar_image = Slide.get_bar_image("activity_bar_image")
  end

  def new
    @activity = Activity.new
    respond_with(@activity)
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.save
    respond_with(@activity)
  end

  def update
    @activity.update(activity_params)
    respond_with(@activity)
  end

  def destroy
    @activity.destroy
    respond_with(@activity)
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:title, :content, :activity_type)
    end
end
