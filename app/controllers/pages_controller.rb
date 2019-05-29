class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]

  def home
  end

  def dashboard
    @permits = policy_scope(Permit)
    if params[:status].present?
      @all_permits = Permit.where(status: params[:status])
    else
      @all_permits = Permit.all
    end
    @pending_permits = Permit.where(status: "pending approval").where(approver_id: current_user.id).order(start_date: :asc)
    @approved_permits = Permit.where(status: "approved").where(approver_id: current_user.id).order(start_date: :asc)
    @rejected_permits = Permit.where(status: "rejected").where(approver_id: current_user.id).order(start_date: :asc)
    @edit_permits = Permit.where(status: "rejected").where(approver_id: current_user.id).order(start_date: :asc)
    @edit_permits = Permit.where(status: "rejected").where(author_id: current_user.id).order(start_date: :asc)
    @edit_permits = Permit.where(status: "draft").where(author_id: current_user.id).order(start_date: :asc)
  end
end
