require_relative 'promotions'
require_relative 'order'


class Checkout

  attr_reader :product_list, :promotions, :order, :basket

  def initialize(promotions = Promotions.new, order = Order.new)
    @promotions = promotions
    @order = order
    @basket = Hash.new(0)
  end

  def scan(item)
    order.add(item)
  end

  def total
    initial_total = order.total
    discounted_total = promotions.apply(order.total, order.basket)
    print_total(discounted_total)
  end

  private

  def print_total(total)
    '£%.2f' % total
  end

end
