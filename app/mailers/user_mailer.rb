class UserMailer < ActionMailer::Base
  default from: 'notify-no-reply@codeblue.com'

  def points_awarded_email(coder)
  @coder = coder
  github = Github.new user: 'cpbuckingham', repo: 'codeblue_RoR'
  pr = github.pull_requests.list
  @points = pr.count * 250
  mail(to: coder.email, subject: "Points for Coding")

end
