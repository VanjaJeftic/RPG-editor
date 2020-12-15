class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    can [:create, :update, :destroy], Type, user_id: user.id if user.present?
    can [:create, :update, :destroy], Attribute, user_id: user.id if user.present?
  end
end
