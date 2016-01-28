require 'total_spend_promotion'

describe TotalSpendPromotion do
  subject(:total_spend_promotion) { described_class.new }

  context '#apply_discount?' do
    it 'returns true if discount should be applied' do
      total = described_class::FLOOR_SPEND_FOR_OFFER
      expect(total_spend_promotion.apply_discount?(total)).to eq(true)
    end
    it 'returns false if discount should be applied' do
      total = described_class::FLOOR_SPEND_FOR_OFFER - 1
      expect(total_spend_promotion.apply_discount?(total)).to eq(false)
    end
  end

  context '#discount_amount' do
    it 'returns amount to be discounted for this promotion' do
      total = described_class::FLOOR_SPEND_FOR_OFFER
      discount = (total * described_class::DISCOUNT_FACTOR).round(2)
      expect(total_spend_promotion.discount_amount(total)).to eq(discount)
    end
  end
end
