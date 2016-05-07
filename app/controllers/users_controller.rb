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
    @user.update(params[:user])
    redirect_to user_path(@user)
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
    @user = User.new(params[:user])
    puts params.inspect
    if @user.save
      flash[:notice] = "Welcome to the CerebralPosi blog!"
      redirect_to user_path @user
    else
      flash[:alert] = "Sorry, something went wrong."
      render :new
    end
    
  end
# the following is not a "GET" method
# it will actually update the database
# at the end of the method you will have to
# redirect to a route that will "GET" a view
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
# the following IS a "GET" method
# it simply displays a view page with a form
# THATS IT
  def edit

    @user = User.find(params[:id])
  end
end
