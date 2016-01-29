require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new }

  context '#scan' do
    it 'adds an item to the basket' do
      expect(checkout.scan(001)).to eq(1)
    end
  end

  context '#total' do
    it 'displays final price of basket' do
      checkout.scan(001)
      checkout.scan(002)
      expect(checkout.total).to eq("£54.25")
    end
  end
end
