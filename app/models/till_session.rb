class TillSession < ApplicationRecord
  belongs_to :till

  has_many :sales

  before_validation :set_opened_at, on: :create

  validate :only_one_active_session, on: :create

  scope :active, -> { where(closed_at: nil) }

  def active?
    closed_at.nil?
  end

  def close!(closing_float:)
    update!(
      closed_at: Time.current,
      closing_float: closing_float
    )
  end

  private
    def only_one_active_session
      if TillSession.where(till_id: till_id, closed_at: nil).exists?
        errors.add(:base, "The till already has an active session")
      end
    end

    def set_opened_at
      self.opened_at ||= Time.current
    end
end
