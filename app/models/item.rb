class Item < ApplicationRecord
  def vat_price
    return 0 unless net_price && vat_rate

    (net_price * vat_rate / 100).round(2)
  end

  def gross_price
    return 0 unless net_price

    net_price + vat_price
  end
end
