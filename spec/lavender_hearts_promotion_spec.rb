require 'lavender_hearts_promotion'

describe LavenderHeartsPromotion do
  subject(:lavender_hearts_promotion) { described_class.new }


  context '#number_of_lavender_hearts' do
    it 'returns the number of lavender hearts in basket' do
      basket = {1 => 2}
      expect(lavender_hearts_promotion.number_of_lavender_hearts(basket)).to eq(2)
    end
  end

  context '#apply_discount?' do
    it 'returns true if discount should be applied' do
      basket = {1 => described_class::FLOOR_QUANTITY_FOR_OFFER}
      expect(lavender_hearts_promotion.apply_discount?(basket)).to eq(true)
    end
    it 'returns false if discount should not be applied' do
      basket = {1 => (described_class::FLOOR_QUANTITY_FOR_OFFER - 1)}
      expect(lavender_hearts_promotion.apply_discount?(basket)).to eq(false)
    end
  end

  context '#discount_amount' do
    it 'returns amount to be discounted for this promotion' do
      basket = {1 => described_class::FLOOR_QUANTITY_FOR_OFFER}
      discount = described_class::FLOOR_QUANTITY_FOR_OFFER * described_class::UNIT_DISCOUNT_AMOUNT
      expect(lavender_hearts_promotion.discount_amount(basket)).to eq(discount)
    end

  end

end
