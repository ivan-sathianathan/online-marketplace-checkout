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
    it 'should call #lavender_hearts_promotion.discount_amount with basket as argument' do
      total = 59
      expect(promotions.lavender_hearts_promotion).to receive(:discount_amount).with(basket).and_return(20)
      promotions.apply(total, basket)
    end
  end

  context '#spend_discount' do
    it 'returns true if total spend greater than £60' do
      expect(promotions.spend_discount(61)).to eq(54.9)
    end
  end

end
