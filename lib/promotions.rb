require_relative 'lavender_hearts_promotion'
require_relative 'total_spend_promotion'

class Promotions

  attr_reader :lavender_hearts_promotion, :total_spend_promotion

  def initialize(lavender_hearts_promotion = LavenderHeartsPromotion.new, total_spend_promotion = TotalSpendPromotion.new)
    @lavender_hearts_promotion = lavender_hearts_promotion
    @total_spend_promotion = total_spend_promotion
  end


  def apply(order_total, order_basket)
    basket_discount = apply_basket_discount(order_basket)
    new_total = order_total - basket_discount
    total_spend_discount = apply_total_spend_discount(new_total)
    final_total = new_total - total_spend_discount
  end

  def apply_basket_discount(order_basket)
    lavender_hearts_promotion.discount_amount(order_basket)
  end

  def apply_total_spend_discount(new_total)
    total_spend_promotion.discount_amount(new_total)
  end

end
