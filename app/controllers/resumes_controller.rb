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
    respond_with(@resume)
  end

  def edit
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      flash[:notice] = ''
      Notifier.resume_received(@resume).deliver 
    end

    redirect_to positions_path
    # respond_with(@resume)
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
      params.require(:resume).permit(:title, :content, :resume_type)
    end
end
