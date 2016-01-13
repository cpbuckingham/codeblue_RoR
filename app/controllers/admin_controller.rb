class AdminController < ApplicationController
  # before_action :check_if_admin

  def show
    @coders = Coder.all
    # @coder = Coder.find(params[:id])
    # pull_requests = @coder.pull_requests.year(current_year).order('created_at desc')
  end

  def index
  end

end
