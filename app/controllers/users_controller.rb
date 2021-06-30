class UsersController < ApplicationController
  
  def create
  end
  
  def new
  end
  
  def edit
  end
  
  def show
    @user = User.find_by(id: params[:user_id])
  end
  
  def update
  end
end
