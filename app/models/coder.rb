class Coder < ActiveRecord::Base

  def self.pull_requests(year)
    PullRequest.year(year).order('created_at desc')
  end
end
