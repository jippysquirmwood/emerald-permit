class PermitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_permit, only: [:show]
  def index
    @permits = policy_scope(Permit)
    @all_permits = Permit.all
  end

  def show
  end

  def create
    @permit = Permit.new(permit_params)
    @permit.author = current_user
    @permit.status = "pending approval"
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
    @approvers = User.all.where(approver: true)
  end

  def self.statuses
    stasuses = ["draft", "rejected", "pending approval", "approved", "expired"]
    stasuses
  end

  private

  def set_permit
    @permit = Permit.find(params[:id])
    authorize @permit
  end

  def permit_params
    params.require(:permit).permit(Permit.column_names, :approver_id)
  end
end
