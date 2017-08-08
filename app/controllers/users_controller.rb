class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    if @user.blank?
      flash[:success] = I18n.t("static_pages.msg_invalid_user")
      redirect_to signup_path
    else
      flash.now[:success] = I18n.t("static_pages.welcome")
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = I18n.t("static_pages.welcome")
      redirect_to @user
      # Handle a successful save.
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
