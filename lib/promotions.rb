class Promotions

  def spend_discount(total)
    total > 60
  end

  def items_discount(basket)
    basket[1] >=2
  end
end
