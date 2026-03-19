class Sale < ApplicationRecord
  belongs_to :till_session

  has_many :sale_items
  has_many :payments

  before_validation :set_started_at, on: :create

  def open?
    completed_at.nil?
  end

  def completed?
    completed_at.present?
  end

  private
    def set_started_at
      self.started_at ||= Time.current
    end
end
