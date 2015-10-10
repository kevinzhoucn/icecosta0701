class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @resumes = Resume.all
    respond_with(@resumes)
  end

  def show
    respond_with(@resume)
  end

  def new
    @resume = Resume.new
    @position_bar_image = Slide.get_bar_image("position_bar_image")
    respond_with(@resume)
  end

  def edit
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.position_id = params[:position_id]
    position = Position.find(@resume.position_id)

    if @resume.save
      flash[:notice] = ''
      Notifier.resume_received(@resume, position).deliver 
    end

    redirect_to resumes_succeed_path

    # respond_with(@resume)
  end

  def succeed
    @position_bar_image = Slide.get_bar_image("position_bar_image")
  end

  def update
    @resume.update(resume_params)
    respond_with(@resume)
  end

  def destroy
    @resume.destroy
    respond_with(@resume)
  end

  private
    def set_resume
      @resume = Resume.find(params[:id])
    end

    def resume_params
      params.require(:resume).permit(:title, :content, :avatar)
    end
end
