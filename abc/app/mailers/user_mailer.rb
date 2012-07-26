class UserMailer < ActionMailer::Base
  default from: "lina.mam@gmail.com"


def welcome_email(user)
@user=user
@url="http://www.gmail.com"
mail(:to=> user.email, :subject=> "Welcome Mail")
end

end
