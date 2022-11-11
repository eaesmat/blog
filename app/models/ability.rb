class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :manage, Post, author_id: user.id
      can :manage, Comment, author_id: user.id
      can :manage, Like, author_id: user.id
      can :read, :all
    end
  end
end
