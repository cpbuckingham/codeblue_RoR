class AdminController < ApplicationController
  # before_action :check_if_admin

  def show
    @coders = Coder.all
    pull_requests = @coders.pull_requests.year(current_year).order('created_at desc')

  end

  def index
  end



end

private
  def pull_requests
    PullRequest.year(current_year).order('created_at desc').includes(:user)
  end
# def check_if_admin
#   unless (current_user.admin or session[:admin_id])
#     redirect_to "/"
#   end
# end
