class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show
    authorize @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(update_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:approver, :author, :admin)
  end

  def update_params
    params.require(:user).permit(:password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
