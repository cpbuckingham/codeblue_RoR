class UserMailer < ActionMailer::Base
  default from: 'notify-no-reply@codeblue.com'

  def points_awarded_email(coder)
  @coder = coder
  mail(to: coder.email, subject: "Points for Coding")

end
