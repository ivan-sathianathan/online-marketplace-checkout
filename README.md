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
| Order | Details what's in the current basket and calculates total of basket before discounts are applied |
| Product List | Details products and their prices |  
| Checkout | Adds an item to basket via scan method and calculates total price to be paid once promotions are applied
| Promotions | Applies promotions to current basket and returns final total to be paid to checkout method |
| Lavender Hearts Promotion | Details
| Total Spend Promotion |


##What I like

I like

##What I don't like

There are a few design aspects that I would like to improve:
 - the Order class currently has two responsibilities: (1) to details what's in the current basket and (2) to calculate the value of this basket prior to discount. I would like to create a new class OrderBasketValue which would send to the Order the class the value of its current basket
 - there is too much knowledge contained in the Promotion class' 'apply' method; this method knows to call the apply_discount methods in each of the individual promotion classes, how   currently knows too much about the behavior of the two "sub-promotion" classes (LavenderHeartsPromotion and TotalSpendPromotion), which is reflected by the Promotion 'apply' method knowingto call the 'discount_amount' method in both of the sub-promotion classes. Ideally, the apply method in the Promotion class would call a similar apply method in the sub-promotion classes which would  
