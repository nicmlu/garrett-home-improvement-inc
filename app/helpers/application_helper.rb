module ApplicationHelper
  protect_from_forgery

  def current_client 
    @current_client ||= Client.find_by_id(session[:client_id]) if session[:client_id]
  end 

  def is_logged_in?
    !!session[:client_id]
  end 

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end 

  def login_required
    unless is_logged_in?
      flash[:error] = "Access Denied! You must be logged in."
      redirect_to login_path
    end
  end 
end
