class UserMailer < ActionMailer::Base
  default from: "lina.mam@gmail.com"


  def welcome_email(user)
    @user=user
    @url="http://localhost:3000/users/#{@user.id}/verify_account/"
    mail(:to=> user.email, :subject=> "Welcome Mail")
  end

end
