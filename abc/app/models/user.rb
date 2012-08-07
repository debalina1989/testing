class User < ActiveRecord::Base
  before_save { |user| user.email = email.downcase }

  has_many :posts

  validates :username, :presence=> true, :length=> {:maximum=> 10}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :firstname, :lastname, :presence=> true

  before_create :ensure_username_present, :check_name_in_lowercase, :check_fullname
  before_update :ensure_username_present, :check_name_in_lowercase, :check_fullname

  protected
  def ensure_username_present
    if username.nil?
      self.username=email unless email.blank?
    end
  end

  protected
  def check_name_in_lowercase
    if username==username.downcase
      self.username=username.capitalize unless username.blank?
    end
    if firstname==firstname.downcase || lastname==lastname.downcase
      self.firstname=firstname.capitalize unless firstname.blank?
      self.lastname=lastname.capitalize unless lastname.blank?
    end

  end

  protected
  def check_fullname
    if fullname.blank?
      self.fullname= firstname.capitalize + " " + lastname.capitalize
    end

  end


end
