class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # helper_method :logged_in?, 
  #               :current_user
  # before_action :store_location

  # private

  # def store_location
  #   # Сохраняем только GET-запросы, чтобы не перенаправлять на POST/PUT/DELETE
  #   if request.get? && !request.xhr? && !logged_in?
  #     cookies[:user_return_to] = request.fullpath
  #   end
  # end

  # # def authenticate_user!
  # #   unless current_user
  # #     redirect_to login_path
  # #   end
  # # end
  # def authenticate_user!
  #   unless logged_in?
  #     flash[:alert] = "Для доступа к этой странице необходимо войти в систему."
  #     redirect_to login_path
  #   end
  # end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  # end

  # def logged_in?
  #   current_user.present?
  # end
end
