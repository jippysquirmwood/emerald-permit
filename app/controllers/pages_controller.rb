class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @pending_permits = Permit.where(status: "pending approval").where(approver_id: current_user.id).order(start_date: :asc)
    @approved_permits = Permit.where(status: "approved").where(approver_id: current_user.id).order(start_date: :asc)
    @rejected_permits = Permit.where(status: "rejected").where(approver_id: current_user.id).order(start_date: :asc)
  end
end
