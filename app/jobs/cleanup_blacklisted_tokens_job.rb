class CleanupBlacklistedTokensJob < ApplicationJob
  queue_as :default

  def perform(*args)
    BlacklistedToken.cleanup_expired
  end
end