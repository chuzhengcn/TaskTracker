class TaskHistoriesController < ApplicationController
  before_filter :find_task

  def new
    @task_history = @task.task_histories.build
  end

  def create 
    @task_history = @task.task_histories.build( params[:task_history] )
    if @task_history.save
       redirect_to task_path(@task)
    else
      render :action => :new
    end 
  end

  def destroy
    @task_history = TaskHistory.find(params[:id])
    @task_history.destroy
    redirect_to task_path(@task)
  end

  protected

  def find_task
    @task = Task.find(params[:task_id])
  end
  
end
