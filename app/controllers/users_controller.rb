class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show
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
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      format.html { render :edit }
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:approver, :author, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
