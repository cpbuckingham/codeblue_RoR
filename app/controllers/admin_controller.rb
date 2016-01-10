class AdminController < ApplicationController
  # before_action :check_if_admin

  def show
    @coders = Coder.all
  end

  def index
  end



end
# def check_if_admin
#   unless (current_user.admin or session[:admin_id])
#     redirect_to "/"
#   end
# end
