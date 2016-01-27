class Checkout

  attr_reader :order, :product_list

  def initialize(order = Order.new, product_list = ProductList.new)
    @order = order
    @product_list = product_list
  end

  def scan(item)
    order.add(item)
  end

  def total
    total = 0
    order.basket.each do | k, v |
      item_value = product_list.items[k][:price]
      total += item_value * v
    end
    print_total(total)
  end

  private

  def print_total(total)
    '£%.2f' % total
  end

end

# refactor out product list from initialize method. should come in pricing engine
