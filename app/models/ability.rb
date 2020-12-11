class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :edit, :all
    can :index, :all
    can :destroy, :all

    can :manage, Type, user_id: user.id if user.present?
  end
end