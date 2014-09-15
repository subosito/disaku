class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    unless user.new_record?
      can :manage, Account,  user_id: user.id
      can :manage, Category, user_id: user.id
      can :manage, Transfer, user_id: user.id
      can :manage, Transaction, account: { user_id: user.id }
      can :create, Transaction
    end
  end
end
