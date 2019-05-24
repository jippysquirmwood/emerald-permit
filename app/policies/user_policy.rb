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
end
