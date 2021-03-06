class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_token

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  # has_many :roles
  has_many :user_roles
  has_many :roles, through: :user_roles #class_name: "UserRole", foreign_key: :user_id
  has_many :safes, foreign_key: :owner_id

  # has_many :accounts, foreign_key: :user_id, class_name: "AccountsLink"

  has_many :accounts_links, class_name: 'AccountsLink', foreign_key: :user_id
  has_many :accounts, through: :accounts_links


  accepts_nested_attributes_for :roles
  # accepts_nested_attributes_for :safes

  # belongs_to :safe, optional: true
  validates :password, length: { minimum: 6 }, allow_blank: true
  # has_many :safes, foreign_key: :user_id

  scope :actual,  -> {where(approved: true).order(:username)}

  ROLES = [0, :manager, :docbase, :buyer, :sales, :hr, :fin].freeze 

  def self.find_version_author(version)
    find(version.terminator) if version.terminator  
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def name
    self.username.nil? ? self.email : self.username
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def avatar_for
    self.avatar.try(:url).nil? ? '/assets/unknown.png' : self.avatar.url
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    # UserMailer.account_activation(self).deliver_now
  end

  def name
    username.present? ? username : email
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    # UserMailer.password_reset(self).deliver_now
  end

  def has_role?(r_id)
      return true if self.admin?
      if r_id.class == Symbol
        role_id = ROLES.index(r_id)
      else
        role_id = r_id
      end
      !self.user_roles.find_by(role_id: role_id).nil?
  end

  def has_roles()
      r = self.roles.map{ |r| ROLES[r.role_id] }
      r << :admin if self.admin?
      r
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def author_of?(obj)
    #puts "cur_user #{self.email} id:#{id} obj.user_id: #{obj.user_id}"
    self.id == obj.user_id
  end

  def city_name
    city.try(:name)
  end

  def self.valid_login?(email, password)
    user = where(email: email).first
    [user&.valid_password?(password), user]
  end

  def update_token
    self.token  = User.new_token
  end

  private
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_token
      self.token  = User.new_token
#      self.activation_digest = User.digest(activation_token)
      # self.activation_digest = User.digest(activation_token)
    end


end
