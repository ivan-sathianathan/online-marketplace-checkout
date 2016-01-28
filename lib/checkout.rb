class Checkout

  attr_reader :product_list, :promotions, :basket

  def initialize(product_list = ProductList.new, promotions = Promotions.new)
    @product_list = product_list
    @promotions = promotions
    @basket = Hash.new(0)
  end

  def scan(item)
    fail "ProductId #{item} does not exist" unless product_list.has_product?(item)
    basket[item] += 1
  end

  def total
    initial_total = total_before_discounts(basket)
    discounted_total = promotions.apply(initial_total, basket)
    print_total(discounted_total)
  end


  private

  def total_before_discounts(basket)
    total = 0
    basket.each do | k, v |
      item_value = product_list.items[k][:price]
      total += item_value * v
    end
    total
  end

  def print_total(total)
    '£%.2f' % total
  end

end
