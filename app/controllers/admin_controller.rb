class AdminController < ApplicationController
  # before_action :check_if_admin

  def show
    @coders = Coder.all
    @pull_requests = github_client.pull_requests(@coders)

  end

  def index
  end

end

private

  def github_client
    GithubService.new
  end

# def check_if_admin
#   unless (current_user.admin or session[:admin_id])
#     redirect_to "/"
#   end
# end
