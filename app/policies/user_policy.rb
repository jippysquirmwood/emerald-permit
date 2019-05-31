class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.all
      end
    end
  end

  def show?
    true
  end

  def edit?
    record == user
  end

  def update?
    edit?
  end
end
