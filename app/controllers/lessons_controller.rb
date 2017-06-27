require 'pry'

class LessonsController < ApplicationController

  def show
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:week_id])
    @lesson = Lesson.find(params[:id])
    @prev = @lesson.previous
    @next = @lesson.next

  end

  def new
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:week_id])
    @lesson = @week.lessons.new
  end

  def create
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:week_id])
    @lesson = @week.lessons.new(lesson_params)
    if @lesson.save
      redirect_to course_week_path(@course,@week)
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:week_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:week_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to course_week_path(@course,@week)
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @week = Week.find(params[:week_id])
    @week.lessons.find(params[:id])
    @lesson = @week.lessons.find(params[:id])
    @lesson.destroy
    redirect_to course_week_path(@week)
  end

private
  def lesson_params
    params.require(:lesson).permit(:description, :number, :title, :content, :week_id)
  end
end
