class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @pending_permits = Permit.where(status: "pending").where(approver_id: current_user.id).order(start_date: :asc)
  end
end
