require 'promotions'

describe Promotions do
  subject(:promotions) { described_class.new }

  let(:basket) { {1 => 2} }

  context '#apply' do
    it 'should call #spend_discount with total as argument' do
      basket = { 1 => 1 }
      total = 59
      expect(promotions).to receive(:spend_discount).with(total)
      promotions.apply(total, basket)
    end
    it 'should call #items_discount with basket as argument' do
      total = 59
      expect(promotions).to receive(:items_discount).with(total, basket).and_return(20)
      promotions.apply(total, basket)
    end
  end

  context '#spend_discount' do
    it 'returns true if total spend greater than £60' do
      expect(promotions.spend_discount(61)).to be(54.9)
    end
  end

  context '#items_discount' do
    it 'returns discount if basket includes two or more lavender hearts' do
      total = 10
      expect(promotions.items_discount(total, basket)).to be(8.5)
    end
  end
end
