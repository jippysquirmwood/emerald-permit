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
  # def dashboard
  #   @permits = policy_scope(Permit)
  #   if params[:status].present?
  #     @all_permits = Permit.where(status: params[:status])
  #   else
  #     @all_permits = Permit.all
  #   end
  #   @pending_permits = Permit.where(status: "pending approval").where(approver_id: current_user.id).order(start_date: :asc)
  #   @approved_permits = Permit.where(status: "approved").where(approver_id: current_user.id).order(start_date: :asc)
  #   @rejected_permits = Permit.where(status: "rejected").where(approver_id: current_user.id).order(start_date: :asc)
  #   if params[:s].present?
  #     PgSearch::Multisearch.rebuild(Permit)
  #     # PgSearch::Multisearch.rebuild(User)
  #     results = PgSearch.multisearch(params[:s])
  #     @results = results.map { |result| result.searchable }
  #     @search_users = @results.select{ |r| r.respond_to? :first_name }
  #     @search_permits = @results.select{ |r| r.respond_to? :title }
  #   else
  #     @search_users = []
  #     @search_permits = []
  #   end
  # end
end
