class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    can :manage, Type, user_id: user.id if user.present?
    can :manage, Attribute, type: { user_id: user.id } if user.present?
  end
end
