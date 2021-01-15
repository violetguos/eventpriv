class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    begin
      User.find(session[:user_id])
      @current_user ||= User.find(session[:user_id]) if session[:user_id]

    rescue => exception
      flash[:notice] = "not logged in"
      nil
    end  
    
  end
  helper_method :current_user, :logged_in?, :lookup_user_by_id

  def authorize
    redirect_to '/login' unless current_user
  end

  def logged_in?
    current_user != nil
  end

  def lookup_user_by_id(id)
    User.find(id)
  end
end
