class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      # redirect_to tests_path
      redirect_to(cookies.delete(:user_return_to) || tests_path)
    else
      render :new
    end
  end
  if @user&.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to tests_path
  else
    #flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
    render :new
  end
  
  def destroy
    session[:user_id] = nil # Удаляем идентификатор пользователя из сессии
    cookies.delete(:user_return_to)
    redirect_to root_path, notice: "Вы успешно вышли из системы."
  end
end
