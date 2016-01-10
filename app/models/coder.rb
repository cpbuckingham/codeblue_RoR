class Coder < ActiveRecord::Base

  def self.pull_requests
    PullRequest.year(current_year).order('created_at desc').includes(:user)
  end

end
