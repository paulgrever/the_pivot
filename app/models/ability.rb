class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :view, :all
    else
      can :view, User, id: user.id
    end
  end
end
