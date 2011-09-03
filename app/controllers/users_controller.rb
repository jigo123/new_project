class UsersController < ApplicationController

  def edit
    @user = current_user
  end
  
  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes!(params[:user])
      redirect_to(@user, :notice => 'Profile was successfully updated.')
    else
      render :action => "edit"
    end
  end
  
end
