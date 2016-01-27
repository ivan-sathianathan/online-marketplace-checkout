require 'product_list'

describe ProductList do
  subject(:product_list) { described_class.new }

  context "#initialize" do
    it 'starts with a list of items' do
      expect(product_list.items).to eq(described_class::ITEMS)
    end
  end

  context "#has_product?" do
    it 'tells if a product is included in product list' do
      expect(product_list.has_product?(001)).to be(true)
    end
  end

end
