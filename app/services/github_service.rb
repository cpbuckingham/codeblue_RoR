class GithubService < ActiveRecord::Base

  def create
    @coder = Coder.find(params[:id])
    Downloader.new(@coder).get_pull_requests
    pull_requests = @coder.pull_requests.year(current_year).order('created_at desc')
    @coder.send_points_awarded_email

    render :create, locals: { pull_requests: pull_requests }, layout: false
  end
end
