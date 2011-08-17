class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update_attributes(params[:user])
     flash[:notice] = '用户编辑成功'
     redirect_to users_url
   else
     render :action => "edit"
   end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = '成功添加用户'
      redirect_to users_url
    else
      render :action => 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = '用户已成功删除'
    redirect_to users_url
  end
end
