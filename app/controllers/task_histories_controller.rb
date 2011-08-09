class TaskHistoriesController < ApplicationController
  before_filter :find_task,:get_user

  def create 
    if @user.blank?
       flash[:notice] = '添加失败，您没有权限'
    else
      params[:task_history][:user_id] = @user.id
      @task_history = @task.task_histories.build( params[:task_history] )
      if @task_history.save
         flash[:notice] = '提测成功'
      else
         flash[:notice] = '添加失败'
      end
    end 
    redirect_to task_path(@task)
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

  def get_user
    @user = User.find_by_bind_ip(request.remote_ip)
  end
  
end
