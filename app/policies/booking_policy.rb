class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)#.where(status: 'pending')
    end
  end
  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
   record.offer.user == user
  end

  def accept?
    record.offer.user == user
  end

  def reject?
    record.offer.user == user
  end
end
