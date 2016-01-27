require 'promotions'

describe Promotions do
  subject(:promotions) { described_class.new }

  let(:basket) { {1 => 2} }

  context '#spend_discount' do
    it 'returns true if total spend greater than £60' do
      expect(promotions.spend_discount(61)).to be(true)
    end
  end

  context '#items_discount' do
    it 'returns true if basket includes two or more lavender hearts' do
      expect(promotions.items_discount(basket)).to be(true)
    end
  end
end
