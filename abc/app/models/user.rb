# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  email           :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  firstname       :string(255)
#  lastname        :string(255)
#  fullname        :string(255)
#  contact         :integer
#  user_type       :integer
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_protected :created_at, :updated_at
  attr_accessible :username, :email, :firstname, :lastname, :password, :password_confirmation

  has_secure_password

  validates :username, :presence=> true, :length=> {:maximum=> 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :firstname, :lastname, :presence => true
  validates :password, :password_confirmation, :presence=> true

  before_create :ensure_username_present, :check_name_in_lowercase, :check_fullname
  before_update :ensure_username_present, :check_name_in_lowercase, :check_fullname
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  has_many :posts


  protected

  def ensure_username_present
    if username.nil?
      self.username=email unless email.blank?
    end
  end

  def check_name_in_lowercase
    if username == username.downcase
      self.username = username.capitalize unless username.blank?
    end
    if firstname == firstname.downcase || lastname == lastname.downcase
      self.firstname = firstname.capitalize unless firstname.blank?
      self.lastname = lastname.capitalize unless lastname.blank?
    end

  end

  def check_fullname
    if fullname.blank?
      self.fullname= firstname.capitalize + " " + lastname.capitalize
    end
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
