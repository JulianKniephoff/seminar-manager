class Ability
  include CanCan::Ability

  # TODO Can we also say something like this:
  #     can ..., user: user
  # ?
  def initialize(user)
    if user.present?
      can :create, Idea
      can [:update, :destroy], Idea, author_id: user.id

      can :create, Comment
      can [:update, :destroy], Comment, author_id: user.id

      can :create, Like
      can :destroy, Like, user_id: user.id
    end
    can :read, :all
  end
end
