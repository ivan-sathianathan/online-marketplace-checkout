class LavenderHeartsPromotion

  FLOOR_QUANTITY_FOR_OFFER = 2
  UNIT_DISCOUNT_AMOUNT = 0.75

  def discount_amount(basket)
    if apply_discount?(basket)
      (UNIT_DISCOUNT_AMOUNT * number_of_lavender_hearts(basket)).round(2)
    else
      0
    end
  end

  def apply_discount?(basket)
    number_of_lavender_hearts(basket) >= FLOOR_QUANTITY_FOR_OFFER
  end

  def number_of_lavender_hearts(basket)
    lavender_hearts_quantity = !basket[1].nil? ? basket[1] : 0
  end
end
