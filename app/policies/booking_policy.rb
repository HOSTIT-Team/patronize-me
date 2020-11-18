class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user).where(status: 'pending')
    end
  end
  def create?
    true
  end

  def show?
    true
  end
end
