class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  # , :confirmable

  # attr_writer :login

  # def login
  #   @login || self.username || self.email
  # end

  # def active_for_authentication? 
  #   super && approved? 
  # end 
  def has_role?(r_id)
    return true if self.admin?
    # if r_id.class == Symbol
    #   role_id = ROLES.index(r_id)
    # else
    #   role_id = r_id
    # end
    # !self.roles.find_by(role_id: role_id).nil?
  end

  def has_roles()
      r = self.roles.map{ |r| ROLES[r.role_id] }
      r << :admin if self.admin?
      r
  end
  
  def name
    username.present? ? username : email
  end

  def inactive_message 
    approved? ? super : :not_approved
  end
end
