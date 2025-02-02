class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def show
     @user = User.find(params[:id]) or record_not_found
     @courses = Course.where(user: @user)
  end

  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
	log_in @user
	flash[:success] = "Log in successfully!"
	redirect_to :courses
    else
      render 'new'
    end
  end

  def edit
	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to courses_path
  end


  private

    def user_params
	params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please login."
        redirect_to login_url
      end
    end

    def correct_user
       @user = User.find(params[:id])
       redirect_to(root_url) unless current_user?(@user) || current_user.admin?
     end

     def admin_user
       redirect_to(root_url) unless current_user.admin?
     end


end
