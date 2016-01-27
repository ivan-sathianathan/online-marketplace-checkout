class Order

  attr_reader :basket, :product_list

  def initialize(product_list = ProductList.new)
    @basket = Hash.new(0)
    @product_list = product_list
  end

  def add(item_id)
    fail "ProductId #{item_id} does not exist" unless product_list.has_product?(item_id)
    basket[item_id] += 1
  end

end
