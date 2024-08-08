# Use this file to easily define all of your cron jobs.
every 1.day, at: '4:30 am' do
  runner "BlacklistedToken.cleanup_expired"
end