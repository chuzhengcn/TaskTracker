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
  end

  def new
    @user = User.new
  end

  def create
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = '人员已成功删除'
    redirect_to users_url
  end
end
