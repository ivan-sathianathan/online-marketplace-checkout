require 'order'

describe Order do
  subject(:order) { described_class.new(product_list) }
  let(:product_list) { double(:product_list, items: {
    001 => { name: "Lavender heart", price: 9.25 },
    002 => { name: "Personalised cufflinks", price: 45.00 },
    003 => { name: "Kids T-shirt", price: 19.25 }
    })
  }


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
      allow(product_list).to receive(:has_product?).with(001).and_return(true)
      allow(product_list).to receive(:has_product?).with(002).and_return(true)
      basket = {001 => 2, 002 =>1}
      2.times { order.add(001) }
      order.add(002)
      expect(order.basket).to eq(basket)
    end
    it 'doesn\'t allow an item to be added to basket that is not on product list' do
      allow(product_list).to receive(:has_product?).with(999).and_return(false)
      expect { order.add(999) }.to raise_error "ProductId 999 does not exist"
    end
  end

  context '#total' do
    it 'displays total price of basket' do
      allow(product_list).to receive(:has_product?).with(001).and_return(true)
      allow(product_list).to receive(:has_product?).with(002).and_return(true)
      order.add(001)
      order.add(002)
      expect(order.total).to eq(54.25)
    end
  end

end
