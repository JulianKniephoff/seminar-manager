class Ability
  include CanCan::Ability

  # TODO Can we also say something like this:
  #     can ..., user: user
  # ?
  def initialize(user)
    if user.present?
      if user.admin?
        can :manage, :all
      end

      can :create, Topic
      can [:update, :destroy], Topic, author_id: user.id

      can :create, Comment
      can [:update, :destroy], Comment, author_id: user.id

      can :create, Like
      can :destroy, Like, user_id: user.id

      can [:update], Talk, speaker_id: user.id
    end
    can :read, :all
    can [:archived, :current], Talk
  end
end
