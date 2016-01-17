class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :create, Idea

      can [:update, :destroy], Idea, author_id: user.id
    end
    can :read, :all
  end
end
