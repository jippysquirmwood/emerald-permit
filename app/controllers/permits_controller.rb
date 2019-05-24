class PermitsController < ApplicationController
  def index
    @permits = Permit.all
  end
end
