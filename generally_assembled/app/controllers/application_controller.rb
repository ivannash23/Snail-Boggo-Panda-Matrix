class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  class ApplicationController < ActionController::Base
    include TheComments::ViewToken

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
  end
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize!
    redirect_to root_path unless current_user
  end
end
