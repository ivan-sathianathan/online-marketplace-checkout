class Promotions

  attr_reader :lavender_hearts_promotion

  def initialize(lavender_hearts_promotion = LavenderHeartsPromotion.new)
    @lavender_hearts_promotion = lavender_hearts_promotion
  end

  def apply(total, basket)
    new_total = total - lavender_hearts_promotion.discount_amount(basket)
    # new_total = items_discount(total, basket)
    spend_discount(new_total)
  end

  def spend_discount(new_total)
    discount = new_total > 60 ? (new_total * 0.1).round(2) : 0
    new_total - discount
  end

end
