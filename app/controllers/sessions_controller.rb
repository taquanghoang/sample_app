class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = I18n.t("static_pages.account_not_activated")
        message += I18n.t("static_pages.check_link")
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = I18n.t("static_pages.login_msg")
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
