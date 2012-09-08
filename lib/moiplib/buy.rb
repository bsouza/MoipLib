module Moiplib
  
  require_relative './card'
  
  class Buy
  
    attr_reader :id, :instalments, :amount, :card
    
    def initialize(id)
      @id = id
    end
    
    def with_total(amount)
      @amount = amount
      self
    end
    
    def divided_into(instalments)
      @instalments = instalments
      self
    end
    
    def with_card(card)
      @card = card
      self
    end
    
  end
  
end