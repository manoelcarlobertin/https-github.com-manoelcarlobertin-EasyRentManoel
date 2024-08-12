class CustomerPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user.admin?
    # user.admin? || user.operator? aqui os 2 tipos de usuários( 'OR' ) podem Editar o registro.
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
