class PermitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_permit, only: [:show]
  def index
    @permits = policy_scope(Permit)
    if params[:s].present?
      PgSearch::Multisearch.rebuild(Permit)
      # PgSearch::Multisearch.rebuild(User)
      results = PgSearch.multisearch(params[:s])
      @results = results.map { |result| result.searchable }
      @search_users = @results.select{ |r| r.respond_to? :first_name }
      @search_permits = @results.select{ |r| r.respond_to? :title }
    else
      @search_users = []
      @search_permits = []
    end
    @all_permits = Permit.all
  end

  def show
    # @columns = Permit.column
    @author = "#{@permit.author.first_name.capitalize} #{@permit.author.last_name.capitalize}"
    @approver = "#{@permit.approver.first_name.capitalize} #{@permit.approver.last_name.capitalize}"
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

  def approve
    @permit = Permit.find(params[:permit_id])
    authorize @permit
    @permit.status = "approved"
    @permit.save
    redirect_to dashboard_path
  end

  def reject
    @permit = Permit.find(params[:permit_id])
    authorize @permit
    @permit.status = "rejected"
    @permit.save
    redirect_to dashboard_path
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
