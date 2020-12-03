# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :edit, :all
    can :index, :all

    if user.present?
      can :manage, Type, user_id: user.id
    end
  end
end
