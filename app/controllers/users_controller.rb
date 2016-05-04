class UsersController < ApplicationController
  def index
    @users = User.all
  end
# the following is not a "GET" method
# it will actually update the database
# at the end of the method you will have to
# redirect to a route that will "GET" a view
  def update
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end
# the following IS a "GET" method
# it simply displays a view page with a form
# THATS IT
  def new
    @user = User.new
  end
# the following is not a "GET" method
# it will actually update the database
# at the end of the method you will have to
# redirect to a route that will "GET" a view
  def create
    @user = User.create(username: params[:user][:username], )
    redirect_to user_path(@user)
  end
# the following is not a "GET" method
# it will actually update the database
# at the end of the method you will have to
# redirect to a route that will "GET" a view
  def destroy
    @user = User.find(params[:id]
    @user.destroy
  end
# the following IS a "GET" method
# it simply displays a view page with a form
# THATS IT
  def edit

    @user = User.find(params[:id])
  end
end
