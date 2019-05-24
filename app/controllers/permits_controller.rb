class PermitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @permits = policy_scope(Permit)
  end

  private

  def set_permit
    @permit = Permit.find(params[:id])
    authorize @permit
  end
end
