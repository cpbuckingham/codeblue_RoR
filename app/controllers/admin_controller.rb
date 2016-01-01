class AdminController < ApplicationController
  # before_action :check_if_admin

  def show
    @coders = Coder.all
    @pull_requests = @coders.pull_requests('2015')

  end

  def index
  end



end

private
# def check_if_admin
#   unless (current_user.admin or session[:admin_id])
#     redirect_to "/"
#   end
# end
