module RequestHelper

  def get_buy_with(card)
    Moiplib::Buy.new(rand(1000)).
                    with_total(rand(1000)).
                    divided_into(rand(12) + 1).
                    with_card(card)
  end
  
  def get_card(buyer, month, year)
    card = Moiplib::Card.new.
                        from(buyer).
                        is(:mastercard).
                        with_number("01479848245").
                        with_code(345).
                        expires_in(month, year)
  end
  
  def get_buyer
    buyer = Moiplib::Buyer.new("Fulano").
                          with_cpf("0456789154").
                          with_phone(32154687)
  end
  
end