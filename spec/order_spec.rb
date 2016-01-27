require 'order'
require 'product_list'

describe Order do
  subject(:order) { described_class.new(product_list) }
  let(:product_list) { double('product_list') }
  let(:basket) do
    {
      001 => 2,
      002 => 1
    }
  end

  before do
    allow(product_list).to receive(:has_product?).with(001).and_return(true)
    allow(product_list).to receive(:has_product?).with(002).and_return(true)
  end

  context '#initialize' do
    it 'starts with an empty basket' do
      expect(order.basket).to eq({})
    end
    it 'starts with a list of products' do
      expect(order.product_list).to eq(product_list)
    end
  end

  context '#add' do
    it 'adds items to basket' do
      create_order
      expect(order.basket).to eq(basket)
    end
    it 'doesn\'t allow an item to be added to basket that is not on product list' do
      allow(product_list).to receive(:has_product?).with(999).and_return(false)
      expect { order.add(999) }.to raise_error "ProductId 999 does not exist"
    end
  end

  def create_order
    order.add(001)
    order.add(001)
    order.add(002)
  end

end
