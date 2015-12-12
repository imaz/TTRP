class RequestToAnalyticsService
  def perform(data)
    account           = Account.find(data[:account_id)
    analytics_client  = Analytics::Client.new(Settings.analytics_api_key])

    account_attributes = {
      account_id:         account.id,
      account_name:       account.name,
      account_user_count: account.users.count
    }

    account.users.each do |user|
      analytics_client.request({
        type:  data[:type],
        id:    user.id,
        email: user.email
      }.merge(account_attributes))
    end
  rescue e
    raise ConnectionFailureException.new(e.message)
  end
end

RequestToAnalyticsService.new.perform(args)
