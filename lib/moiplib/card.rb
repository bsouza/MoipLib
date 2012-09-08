module Moiplib
  
  require_relative './buyer'

  class Card
    
    attr_reader :owner, :number, :code, :type
    
    TYPES = { 
      american_express: "American Express",
      diners:           "Diners",
      hipercard:        "Hipercard",
      mastercard:       "Mastercard",
      visa:             "Visa"
    }
    
    def from(owner)
      @owner = owner
      self
    end
    
    def is(type)
      @type = TYPES.fetch type
      self
    end
    
    def with_number(number)
      @number = number
      self
    end
    
    def with_code(code)
      @code = code
      self
    end
    
    def expires_in(month, year)
      @expiration_month = month
      @expiration_year = year
      self
    end
    
    def expiration_date
      "#{@expiration_month}/#{@expiration_year}"
    end
    
  end
  
end