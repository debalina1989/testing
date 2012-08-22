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
  attr_protected :id, :created_at, :updated_at
  attr_accessible :username, :email, :firstname, :lastname, :password, :password_confirmation, :verified_at, :terms_of_service, :contact

  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
  class_name:  "Relationship",
  dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  validates :username, :presence=> true, :length=> {:maximum=> 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, :allow_blank => true
  #validates :firstname, :lastname, :presence => true
  #validates :password, :password_confirmation, :presence=> true
  validates :contact, :numericality => true, :allow_blank => true
  validates :terms_of_service, :acceptance => true


  before_validation :ensure_username_present
  before_create :check_name_in_lowercase, :check_fullname
  before_update :check_name_in_lowercase, :check_fullname
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token


  def feed
    # This is preliminary. See "Following users" for the full implementation.
    # Post.where("user_id = ?", id)

    Post.from_users_followed_by(self)

  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def verified?
    !self.verified_at.nil?
  end


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
