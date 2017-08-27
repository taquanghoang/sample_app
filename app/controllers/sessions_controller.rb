class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      check_active user
    else
      flash.now[:danger] = t"static_pages.login_msg"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def check_active user
    if user.activated?
      log_in user
      params[:session][:remember_me] == Settings.remember_me ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash[:warning] = t"static_pages.check_link"
      redirect_to root_url
    end
  end
end
