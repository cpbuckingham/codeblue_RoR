class GithubService < ActiveRecord::Base

  def initialize
    @github = Github.new
  end

  def retrieve_pull_requests(usernames)
    usernames.map do |username|
      {
        username: username,
        pull_requests: retrieve_pull_requests(username)
      }
    end
  end

  def retrieve_pull_requests(username)
    @github.repos(username).map { |repo| repo.pulls.count}.inject(:+)
  end

end
