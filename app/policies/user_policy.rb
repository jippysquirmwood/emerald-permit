class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.all
      end
    end
  end

  def show?
    record == user
  end

  def edit?
    show?
  end

  def update?
    show?
  end
end
