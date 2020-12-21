class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Type, user_id: user.id
    can :manage, Type, user_id: user.id
    can :read, Attribute, user_id: user.id
    can :manage, Attribute
  end
end
