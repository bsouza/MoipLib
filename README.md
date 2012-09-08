Example
=======

```ruby
re_relative '../lib/request'

buyer = Moiplib::Buyer.new("Fulano").
  with_cpf("0136564867").
  with_phone(32154687)

card = Moiplib::Card.new.
  from(buyer).
  is(:mastercard).
  with_number("01479848").
  with_code(345).
  expires_in(8, 2015)
  
buy = Moiplib::Buy.new(18).
  with_total(150).
  divided_into(5).
  with_card(card)
  
action = Moiplib::Actions::DirectPayment.new(buy)
moip = Moiplib::Request.new

result = moip.request(action)

if moip.success? then
  puts "true"
else
  puts result
end
```
