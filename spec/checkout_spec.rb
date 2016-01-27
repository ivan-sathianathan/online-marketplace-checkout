require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new(order_klass.new, product_list_klass.new) }

  let(:order) { double('order') }
  let(:order_klass) { double(:order_klass, new: order) }

  let(:product_list) { double('product_list',
    items:
      {
        001 => { name: "Item 1", price: 1.00 },
        002 => { name: "Item 2", price: 2.00 },
        003 => { name: "Item 3", price: 8.50 }
      }
  ) }
  let(:product_list_klass) { double(:product_list_klass, new: product_list) }

  context '#initialize' do
    it 'starts with a new order' do
      expect(checkout.order).to eq(order)
    end
  end

  context '#scan' do
    it 'adds an item to the basket' do
      allow(order).to receive(:add).with(001)
      allow(order).to receive(:basket).and_return( {001 => 1} )
      checkout.scan(001)
      expect(checkout.order.basket).to eq ({001 => 1})
    end
  end

  context '#total' do
    it 'displays total price of basket' do
      allow(order).to receive(:add).with(001)
      allow(order).to receive(:add).with(002)
      allow(order).to receive(:basket).and_return( {001 => 1, 002 => 1} )
      checkout.scan(001)
      checkout.scan(002)
      expect(checkout.total).to eq("£3.00")
    end
  end
end
