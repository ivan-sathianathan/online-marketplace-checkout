class Promotions

  def apply(total, basket)
    new_total = items_discount(total, basket)
    spend_discount(new_total)
  end

  def items_discount(total, basket)
    discount = !basket[1].nil? && basket[1] >= 2 ? ((basket[1] * 0.75)).round(2) : 0
    total - discount
  end

  def spend_discount(new_total)
    discount = new_total > 60 ? (new_total * 0.1).round(2) : 0
    new_total - discount
  end

end
