class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Issue, user_id: user.id
  end
end