class PermitPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.all
      elsif user.author
        scope.where(author: user)
      elsif user.approver
        scope.where(approver: user)
      else
        scope.where(status: "approved")
      end
    end
  end

  def show?
    true
  end

  def create?
    user.author || user.approver
  end

  def update?
    record.author == user
  end

  def destroy?
    update?
  end
end
