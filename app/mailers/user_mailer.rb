class UserMailer < ActionMailer::Base
  default from: "hidden-earth-9737.herokuapp.com/"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email(user)
    @user = user
    # @url = "hidden-earth-9737.herokuapp.com/"
    @greeting = "Hello"

    mail to: @user.email, subject: "You are ready to play at Betastore!"
  end
end
