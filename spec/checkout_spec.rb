require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new }
  items = { "001": {name: "Item 1", price: "£1.00"},
            "002": {name: "Item 2", price: "£2.00"},
            "003": {name: "Item 3", price: "£3.50"}
          }

  context '#initialize' do
    it 'starts with an empty basket' do
      expect(checkout.basket).to eq({})
    end
    it 'starts with a list of items' do
      expect(checkout.items).to eq(items)
    end
  end

  context '#scan' do
    it 'adds an item to the basket' do
      checkout.scan('001')
      expect(checkout.basket).to eq ({'001': 1})
    end
  end

  context '#total' do
    it 'displays total price of basket' do
      checkout.scan('001')
      checkout.scan('002')
      expect(checkout.total).to eq("£3.00")
    end
  end
end
