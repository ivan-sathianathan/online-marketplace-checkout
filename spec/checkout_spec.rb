require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new }

  let(:product_list) { double(:product_list) }
  let(:promotions) { double(:promotions) }

  context '#initialize' do
    it 'starts with an empty basket' do
      expect(checkout.basket).to eq({})
    end
  end

  context '#scan' do
    it 'adds an item to the basket' do
      allow(product_list).to receive(:has_product?).with(001).and_return(true)
      checkout.scan(001)
      expect(checkout.basket).to eq ({001 => 1})
    end
    it 'doesn\'t allow an item to be added to basket that is not on product list' do
      allow(product_list).to receive(:has_product?).with(999).and_return(false)
      expect { checkout.scan(999) }.to raise_error "ProductId 999 does not exist"
    end
  end

  context '#total' do
    it 'displays total price of basket' do
      allow(product_list).to receive(:has_product?).with(001).and_return(true)
      allow(product_list).to receive(:has_product?).with(002).and_return(true)
      checkout.scan(001)
      checkout.scan(002)
      expect(checkout.total).to eq("£54.25")
    end
    it 'applies 10% discount if #spend_discount is true' do
      allow(product_list).to receive(:has_product?).and_return(true)
      2.times { checkout.scan(002) }
      allow(promotions).to receive(:spend_discount).and_return(true)
      expect(checkout.total).to eq("£81.00")
    end
    it 'reduces unit price of Lavender hearts if more than two ordered' do
      allow(product_list).to receive(:has_product?).and_return(true)
      2.times { checkout.scan(001) }
      allow(promotions).to receive(:items_discount).and_return(true)
      expect(checkout.total).to eq("£17.00")
    end
  end
end
