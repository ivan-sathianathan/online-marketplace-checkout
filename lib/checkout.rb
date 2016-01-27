class Checkout

  attr_reader :order, :product_list, :promotions

  def initialize( order = Order.new,
                  product_list = ProductList.new,
                  promotions = Promotions.new
                )
    @order = order
    @product_list = product_list
    @promotions = promotions
  end

  def scan(item)
    order.add(item)
    order.basket
  end

  def total
    total = 0
    order.basket.each do | k, v |
      item_value = product_list.items[k][:price]
      total += item_value * v
    end
    if !order.basket[1].nil?
      total -= (order.basket[1] * 0.75) if promotions.items_discount(order.basket)
    end
    total = total * 0.9 if promotions.spend_discount(total)
    print_total(total)
  end

  private

  def print_total(total)
    '£%.2f' % total
  end

end

# refactor out product list from initialize method. should come in pricing engine
