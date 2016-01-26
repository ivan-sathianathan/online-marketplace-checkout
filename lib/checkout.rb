class Checkout

  attr_reader :basket, :items

  def initialize
    @basket = {}
    @items = {
              "001": {name: "Item 1", price: "£1.00"},
              "002": {name: "Item 2", price: "£2.00"},
              "003": {name: "Item 3", price: "£3.50"}
            }
  end

  def scan(item)
    item = item.to_sym
    basket[item] ? basket[item] += 1 : basket[item] = 1
  end

  def total
    total = 0
    basket.each do | k, v |
      item_value = convert_to_float(items[k][:price])
      total += item_value * v
    end
    '£%.2f' % total
  end

  private

  def convert_to_float(item_price)
    item_price.gsub(/[£,]/,'').to_f
  end

end
