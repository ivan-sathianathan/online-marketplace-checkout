require_relative 'lavender_hearts_promotion'
require_relative 'total_spend_promotion'

class Promotions

  attr_reader :lavender_hearts_promotion, :total_spend_promotion, :order

  def initialize(lavender_hearts_promotion = LavenderHeartsPromotion.new, total_spend_promotion = TotalSpendPromotion.new)
    @lavender_hearts_promotion = lavender_hearts_promotion
    @total_spend_promotion = total_spend_promotion
  end


  def apply(order_total, order_basket)
    lavender_hearts_discount = lavender_hearts_promotion.discount_amount(order_basket)
    new_total = order_total - lavender_hearts_discount
    total_spend_discount = total_spend_promotion.discount_amount(new_total)
    final_total = new_total - total_spend_discount
  end

end
