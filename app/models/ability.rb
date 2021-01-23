class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Type
    can :read, Attribute

    can :manage, Type, user_id: user.id
    can :manage, Attribute
  end
end
