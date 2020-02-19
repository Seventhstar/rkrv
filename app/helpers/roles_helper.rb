module RolesHelper
  def is_admin?
    current_user&.admin?
  end

  def has_role?(role)
    current_user.has_role?(role)
  end

  def just_role(role)
    current_user.has_role?(role) && !is_admin?
  end

  def is_author_of?(obj)
    current_user.author_of?(obj)
  end

  def just_manager?
    is_manager? && !is_admin?    
  end

  def is_manager?
    current_user.has_role?(:manager)
  end
end
