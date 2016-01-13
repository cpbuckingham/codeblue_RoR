class AdminController < ApplicationController
  # before_action :check_if_admin

  def show
    @coders = Coder.all
    github = Github.new user: 'cpbuckingham', repo: 'codeblue_RoR'
    @pr = github.pull_requests.list
    # @coder = Coder.find(params[:id])
    # pull_requests = @coder.pull_requests.year(current_year).order('created_at desc')
  end

  def index
  end

end
