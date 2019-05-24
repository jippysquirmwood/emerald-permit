class PermitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_permit, only: [:show]
  def index
    @permits = policy_scope(Permit)
  end

  def show
  end

  def create
    @permit = Permit.new
    @permit.author = current_user
    authorize @permit
    if @permit.save
      redirect_to permits_path
    else
      render :new
    end
  end

  def new
    @permit = Permit.new
    authorize @permit
  end

  private

  def set_permit
    @permit = Permit.find(params[:id])
    authorize @permit
  end
end
