class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create show)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  before_action :load_user, only: %i(show update destroy)

  def index
    @users = User.paginate(page: params[:page])
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t"static_pages.check_mail"
      redirect_to root_url
      # Handle a successful save.
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t"static_pages.profile_updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    if @user.destroy
       flash[:success] = t"static_pages.user_deleted"
       redirect_to users_url
    else
       flash[:success] = t"static_pages.user_deleted_fail"
       redirect_to users_url
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t"static_pages.no_user"
    redirect_to root_path
  end

  # Confirms a logged-in user.
  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t"static_pages.please_login"
    redirect_to login_url
  end

  # Confirms the correct user.
  def correct_user
    unless @user
      flash[:danger] = t"static_pages.no_user"
      redirect_to root_path
    end
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
