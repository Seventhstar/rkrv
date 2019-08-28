class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 # devise :database_authenticatable, 
  #       :recoverable, :rememberable, :validatable
  attr_accessor :login
  attr_accessor :username, :email, :password, :password_confirmation, :login
  # :remember_me

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
#    puts "conditions #{conditions}"


    login = conditions.delete(:login)
    email = conditions.delete(:email)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: email.downcase }]).first
  end
end
