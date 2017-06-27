class WeeksController < ApplicationController

  def show
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:id])
  end
  
  def new
    @course = Course.find(params[:course_id])
    @week = @course.weeks.new
  end

  def create
    @course = Course.find(params[:course_id])
    @week = @course.weeks.new(week_params)
    if @week.save
      redirect_to course_path(@week.course)
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:id])
    if @week.update(week_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @course.weeks.find(params[:id])
    @week = @course.weeks.find(params[:id])
    @week.destroy
    redirect_to course_path(@course)
  end

private
  def week_params
    params.require(:week).permit(:timeframe, :description, :course_id)
  end
end
