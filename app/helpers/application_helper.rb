module ApplicationHelper
  def current_client 
    @current_client ||= Client.find_by_id(session[:client_id]) if session[:client_id]
  end 

  def logged_in?
    !!session[:client_id]
  end 

  def redirect_if_not_logged_in
    redirect_to '/' if !logged_in?
  end 
end
