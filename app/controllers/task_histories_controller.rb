# encoding: utf-8
class TaskHistoriesController < ApplicationController
  before_filter :find_task,:get_user

  def create 
    if @user.blank?
       flash[:notice] = '修改状态失败，您没有权限'
    else
      @task.state_id = params[:task_history][:state_id]
      params[:task_history][:user_id] = @user.id
      @task_history = @task.task_histories.build( params[:task_history] )
      if @task_history.save && @task.save 
         flash[:notice] = '任务状态修改成功'
      else
         flash[:notice] = '任务状态修改失败'
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
