class PullRequest < ActiveRecord::Base

  scope :year, -> (year) { where('EXTRACT(year FROM pull_requests.created_at) = ?', year) }
  scope :by_language, -> (language) { where('lower(language) = ?', language.downcase) }
  scope :latest, -> (limit) { order('created_at desc').limit(limit) }
  scope :for_aggregation, -> {
    where(AggregationFilter.pull_request_filter)
  }

  CURRENT_YEAR = '2015'
  EARLIEST_PULL_DATE = Date.parse("01/12/#{CURRENT_YEAR}").midnight
  LATEST_PULL_DATE   = Date.parse("25/12/#{CURRENT_YEAR}").midnight

  class << self
    def active_users(year)
      User.find(PullRequest.year(year).map(&:user_id).compact.uniq)
    end

    def create_from_github(json)
      create(initialize_from_github(json))
    end

    def initialize_from_github(json)
      {
        title:      json['payload']['pull_request']['title'],
        issue_url:  json['payload']['pull_request']['_links']['html']['href'],
        created_at: json['payload']['pull_request']['created_at'],
        state:      json['payload']['pull_request']['state'],
        body:       json['payload']['pull_request']['body'],
        merged:     json['payload']['pull_request']['merged'],
        repo_name:  json['repo']['name'],
        language:   json['repo']['language']
      }
    end

    def download_pull_requests
     github_client.user_events.select do |e|
     event_date = e['created_at']
     e.type == 'PullRequestEvent' &&
     e.payload.action == 'opened' &&
     event_date >= PullRequest::EARLIEST_PULL_DATE &&
     event_date <= PullRequest::LATEST_PULL_DATE
   end

    def in_date_range?
      EARLIEST_PULL_DATE < Time.zone.now && Time.zone.now < LATEST_PULL_DATE
    end
  end

end
