class PostPolicy < ApplicationPolicy
 class Scope < Scope
    def resolve
      if !user.present?
        scope.none
      elsif user.admin_or_moderator?
        scope.all
      else
        scope.where(:user => user)
      end
    end
  end
  def index?
    true
  end
end