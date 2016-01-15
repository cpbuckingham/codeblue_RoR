require 'Faraday'
require 'json'

# sudo gem install octokit --no-rdoc --no-ri
#
# Octokit.configure do |c|
#   c.login = 'cpbuckingham'
#   c.password = 'Yankee179'
# end
#
# Octokit.auto_paginate = true
#
# total = 0
# Octokit.repos.each do |repo|
#   total = total + Octokit.commits("#{Octokit.login}/#{repo.name}", author: Octokit.login).count
# end
#
# puts total

client = Faraday.new
body = client.get("https://api.github.com/users/#{@coder.github_username}/events").body
parsed_body = JSON[body]
counts = parsed_body.map {|c| c["payload"]["distinct_size"] if c["type"] == "PushEvent" }
total = counts.compact.inject(:+)
puts total
