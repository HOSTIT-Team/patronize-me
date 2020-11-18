class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user).where(status: 'pending')
    end

    def index?
      true
    end
  end
end
