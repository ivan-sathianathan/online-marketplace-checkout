class ProductList

  ITEMS = {
    001 => { name: "Lavender heart", price: 9.25 },
    002 => { name: "Personalised cufflinks", price: 45.00 },
    003 => { name: "Kids T-shirt", price: 19.25 }
  }

  attr_reader :items

  def initialize
    @items = ITEMS
  end

  def has_product?(item)
    !items[item].nil?
  end

end
