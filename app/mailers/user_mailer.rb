class UserMailer < ActionMailer::Base
  default from: "Bottle Lives Matter"

  def signup_email(user)
    @user = user
    @twitter_message = "100% re-used bottled water company. Excited for launch."

    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
