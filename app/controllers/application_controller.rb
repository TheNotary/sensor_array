class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def admins_only!
    authenticate_user!
    
    unless current_user.admin
      flash[:error] = "Your user is not set to admin"
      redirect_to '/fail'
    end
  end

end
