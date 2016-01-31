require_relative 'product_list'

class Order

  attr_reader :basket, :product_list, :total

  def initialize(product_list = ProductList.new)
    @basket = Hash.new(0)
    @product_list = product_list
  end

  def add(item)
    fail "ProductId #{item} does not exist" unless product_list.has_product?(item)
    basket[item] += 1
  end

  def total
    total = 0
    basket.each do | k, v |
      item_value = product_list.items[k][:price]
      total += item_value * v
    end
    total
  end

end
