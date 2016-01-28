class TotalSpendPromotion

  FLOOR_SPEND_FOR_OFFER = 60
  DISCOUNT_FACTOR = 0.1

  def discount_amount(total)
    if apply_discount?(total)
      (total * DISCOUNT_FACTOR).round(2)
    else
      0
    end
  end

  def apply_discount?(total)
    total >= FLOOR_SPEND_FOR_OFFER
  end
end
