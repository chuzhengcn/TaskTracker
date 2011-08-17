#encoding: utf-8 
class TasksController < ApplicationController
  def index
    order_by = order_through_link
    @tasks = Task.paginate :page=>params[:page],:order=> order_by,:per_page => 20
    @states = State.all
    @users_developers = get_user_by_dep(1)
    @users_testers = get_user_by_dep(2)
  end
  
  def show
    @task = Task.find(params[:id])
    @task_history = TaskHistory.new
    @task_history.attachments.build
  end

  def edit
    @task = Task.find(params[:id])
    @users_developers = get_user_by_dep(1)
    @users_testers = get_user_by_dep(2)
    if @task.attachments.blank?
        @task.attachments.build
    end
  end

  def update
    params[:task][:user_ids] ||= []  
    @task = Task.find(params[:id])
   if @task.update_attributes(params[:task])
     flash[:notice] = '任务已成功更新'
     redirect_to task_url(@task)
   else
     render :action => "edit"
   end
  end

  def new
    @task = Task.new
    @users_developers = get_user_by_dep(1)
    @users_testers = get_user_by_dep(2)
    @task.attachments.build
  end

  def create
    params[:task][:user_ids] ||= []
    @task = Task.new(params[:task])
    if @task.save
      flash[:notice] = '任务已成功创建'
      redirect_to tasks_url
    else
      render :action => 'new'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = '任务已成功删除'
    redirect_to tasks_url
  end
  #添加方法
  def today
    @tasks = Task.today_all
    get_today_task_count
    render :action => 'today'
  end
  
  def today_submit_test
    @tasks = Task.today_test
    get_today_task_count
    render :action => 'today'
  end

  def today_test_over
    @tasks = Task.today_test_over
    get_today_task_count
    render :action => 'today'
  end

  def today_deliver
    @tasks = Task.today_deliver
    get_today_task_count
    render :action => 'today'
  end

  def thisweek
    @tasks = Task.thisweek_all
    get_week_task_count
    render :action => 'thisweek'
  end
  
  def thisweek_submit_test
    @tasks = Task.thisweek_test
    get_week_task_count
    render :action => 'thisweek'
  end

  def thisweek_test_over
    @tasks = Task.thisweek_test_over
    get_week_task_count
    render :action => 'thisweek'
  end

  def thisweek_deliver
    @tasks = Task.thisweek_deliver
    get_week_task_count
    render :action => 'thisweek'
  end
  
  def search
    @tasks = Task.where( [ "name like ?", "%#{params[:keyword]}%" ])
  end

  def by_user
    tasks_total = get_tasks_by_user(params[:userid])
    @tasks = tasks_total.paginate :page=>params[:page],:order=>'created_at desc',:per_page => 20
    @states = State.all
    @users_developers = get_user_by_dep(1)
    @users_testers = get_user_by_dep(2)
    flash.now[:notice] = User.find(params[:userid]).name+'的任务有'+tasks_total.size.to_s+'个'
    render :template => 'tasks/filter'
  end

  def by_state
    tasks_total = Task.where([ "state_id = ?",params[:stateid] ] )
    @tasks = tasks_total.paginate :page=>params[:page],:order=>'created_at desc',:per_page => 20
    @states = State.all
    @users_developers = get_user_by_dep(1)
    @users_testers = get_user_by_dep(2)
    flash.now[:notice] = State.find(params[:stateid]).name+'的任务有'+tasks_total.size.to_s+'个'
    render :template => 'tasks/filter'
  end

  def me
    user = User.find_by_bind_ip(request.remote_ip)
    unless user.blank?
      @tasks = get_tasks_by_user(user.id)
      @user_name = user.name
    end
  end
  
  #私有方法
  private
  #根据主键Id暂时写死要查询的user分类
  def get_user_by_dep(dep_id)
    users = User.where(:department_id=> dep_id)
  end

  def get_tasks_by_user(user)
    userselected = User.find(user)
    tasks = []
    not_deliver_tasks = Task.where("state_id != ? ",7);
    for d in not_deliver_tasks
      if d.users.include?(userselected)
        tasks << d
      end
    end
    tasks
  end

  def get_today_task_count
    @tasks_test_count = Task.today_test.size.to_s
    @tasks_test_over_count = Task.today_test_over.size.to_s
    @tasks_deliver_count = Task.today_deliver.size.to_s
  end

  def get_week_task_count
    @tasks_test_count = Task.thisweek_test.size.to_s
    @tasks_test_over_count = Task.thisweek_test_over.size.to_s
    @tasks_deliver_count = Task.thisweek_deliver.size.to_s
  end

  def order_through_link
    case params[:order_by]
    when "state_id"
      order_by =  params[:order_by] + ' asc'
    when nil
      order_by = 'created_at desc'
    else
      order_by =  params[:order_by] + ' desc'
    end
    return order_by
  end
end
