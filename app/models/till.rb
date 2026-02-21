class Till < ApplicationRecord
  has_many :till_sessions, dependent: :restrict_with_error

  def active_session?
    till_sessions.where(closed_at: nil).exists?
  end

  def active_session
    till_sessions.find_by(closed_at: nil)
  end
end
