class SaleItem < ApplicationRecord
  belongs_to :sale
  belongs_to :item

  validate :sale_not_completed, on: [ :create, :update ]

  private
    def sale_not_completed
      if sale.completed?
        errors.add(:base, "The sale has already been completed")
      end
    end
end
