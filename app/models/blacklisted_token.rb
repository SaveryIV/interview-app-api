class BlacklistedToken < ApplicationRecord
  validates :token, presence: true, uniqueness: true

  def self.cleanup_expired
    where('expires_at < ?', Time.current).destroy.all
  end
end
