class Cpanel::ActivitiesController < Cpanel::ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @activities = Activity.all.page params[:page]
    respond_with(@activities)
  end
  
  def show
    respond_with(@activity)
  end

  def new
    @activity = Activity.new
    respond_with(@activity)
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to cpanel_activities_index_path
    end
    # respond_with(@activity)
  end

  def update
    if @activity.update(activity_params)
      redirect_to cpanel_activities_index_path
    end
    # respond_with(@activity)
  end

  def destroy
    if @activity.destroy
      redirect_to cpanel_activities_index_path
    end
    # respond_with(@activity)
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:title, :content, :activity_type)
    end
end
