require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new(order_klass.new, product_list_klass.new) }

  let(:order) { double('order') }
  let(:order_klass) { double(:order_klass, new: order) }

  let(:product_list) { double('product_list',
    items:
      {
        001 => { name: "Lavender heart", price: 9.25 },
        002 => { name: "Personalised cufflinks", price: 45.00 },
        003 => { name: "Kids T-shirt", price: 19.25 }
      }
  ) }
  let(:product_list_klass) { double(:product_list_klass, new: product_list) }

  let(:promotions) { double('promotions') }
  let(:promotions_klass) { double(:promotions_klass, new: promotions) }

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
      expect(checkout.total).to eq("£54.25")
    end
    it 'applies 10% discount if #spend_discount is true' do
      allow(order).to receive(:basket).and_return( {002 => 2} )
      allow(promotions).to receive(:spend_discount).and_return(true)
      expect(checkout.total).to eq("£81.00")
    end
    it 'reduces unit price of Lavender hearts if more than two ordered' do
      allow(order).to receive(:basket).and_return( {001 => 2} )
      allow(promotions).to receive(:items_discount).and_return(true)
      expect(checkout.total).to eq("£17.00")
    end
  end
end
