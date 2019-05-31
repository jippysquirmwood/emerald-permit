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
    user.author || user.approver || user.admin
  end

  def update?
    record.author == user || record.approver == user || user.admin
  end

  def destroy?
    update?
  end

  def approve?
    record.approver == user || user.admin
  end

  def reject?
    approve?
  end
end
