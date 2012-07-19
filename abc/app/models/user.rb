class User < ActiveRecord::Base
  attr_accessible :username, :email, :firstname, :lastname, :contact, :user_type, :fullname

has_many :posts

validates :username, :presence=> true, :length=> {:maximum=> 10}
validates :email, :presence=> true
validates :firstname, :lastname, :presence=> true

before_create :ensure_username_present
before_create :check_name_in_lowercase
before_create :check_fullname


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
end

protected
def check_fullname
if fullname.nil?
self.fullname= firstname + " " + lastname
end
if fullname==fullname.downcase
self.fullname=fullname.capitalize unless fullname.blank?
end
end


end
