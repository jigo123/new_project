class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.profile_completed
        render 'logged_in'
      else 
        redirect_to edit_user_path(current_user)
      end
    end
  end

end
