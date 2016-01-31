# Online Marketplace Checkout
[![Build Status](https://travis-ci.org/ivan-sathianathan/online-marketplace-checkout.svg?branch=master)](https://travis-ci.org/ivan-sathianathan/online-marketplace-checkout)
[![Coverage Status](https://coveralls.io/repos/github/ivan-sathianathan/online-marketplace-checkout/badge.svg?branch=master)](https://coveralls.io/github/ivan-sathianathan/online-marketplace-checkout?branch=master)

##How to run

1. Clone repo: ``git clone https://github.com/ivan-sathianathan/online-marketplace-checkout.git``
2. In terminal, go into cloned repo and run ``bundle install``
3. Run ``rspec`` to see tests


##Class Structure

| Class | Description |
| --- | --- |
| Order | Details what's in the current basket and calculates total value of basket before discounts are applied |
| Product List | Details products and their prices |  
| Checkout | Adds an item to basket via scan method and calculates total price to be paid once promotions are applied |
| Promotions | Applies promotions to current basket and returns final total to be paid to checkout method |
| Lavender Hearts Promotion | Details logic behind calculating discount when basket contains two or more Lavender Hearts |
| Total Spend Promotion | Details logic to calculate discount when basket value is greater than £60 | 

##Design considerations

The main design consideration that I had to grapple with was making the checkout system extensible to future promotions. At present, promotions come in two distinct flavours: (1) promotions that are applied depending on your basket of items (e.g. buy one get one free on a certain item, buy more than one item and get a discount on these, etc) and (2) promotions that are applied against your total spend (e.g. spend over £50 and get 10% off, spend over £100 and get 15% off, etc). 

Instead of capturing this promotion logic inside the Order or Checkout classes, I created the Promotion class and its 'apply' method to be called by the Checkout whenever the total had to be calculated. This 'apply' method would then call the individual promotions and return back to the checkout the final total. The individual promotion classes contain the logic behind each promotion.

The intention of this is that it should be relatively easy to (1) create new individual promotion classes for future offers, and (2) adapt the Promotions class so that these promotions are called by the checkout.

##Further improvements

The Order class currently has two responsibilities: (1) to details what's in the current basket and (2) to calculate the value of this basket prior to discount. This class' design could be improved to adhere to the Single Responsibility Principle by creating a new class OrderBasketValue class which would be called by the 'total' method in the Order class and contain the logic for calculating the basket value.

Another design improvement would centre around the Promotion class. Firstly, I would like to be able to specify the individual promotions to be applied as initialization arguments, instead of having these promotions specified in the code itself.


