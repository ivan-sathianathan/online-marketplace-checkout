class Promotions

  attr_reader :lavender_hearts_promotion, :total_spend_promotion

  def initialize(lavender_hearts_promotion = LavenderHeartsPromotion.new, total_spend_promotion = TotalSpendPromotion.new)
    @lavender_hearts_promotion = lavender_hearts_promotion
    @total_spend_promotion = total_spend_promotion
  end

  def apply(total, basket)
    new_total = total - lavender_hearts_promotion.discount_amount(basket)
    final_total = new_total - total_spend_promotion.discount_amount(new_total)
  end

end
