class Sale < ApplicationRecord
  belongs_to :till_session

  has_many :sale_items, dependent: :destroy
  has_many :items, through: :sale_items
  has_many :payments, dependent: :destroy

  before_validation :set_started_at, on: :create

  def open?
    completed_at.nil?
  end

  def completed?
    completed_at.present?
  end

  def total_net
    sale_items.sum { |item| item.net_price * item.quantity }
  end

  def total_vat
    sale_items.sum { |item| item.vat_price * item.quantity }
  end

  def total_gross
    sale_items.sum { |item| item.gross_price * item.quantity }
  end

  def total_paid
    payments.sum(:amount)
  end

  def amount_due
    total_gross - total_paid
  end

  def fully_paid?
    amount_due <= 0
  end

  def complete!
    update!(completed_at: Time.current) if fully_paid?
  end

  private
    def set_started_at
      self.started_at ||= Time.current
    end
end
