module Moiplib

  class Buyer
  
    attr_reader :name, :cpf, :phone
    
    def initialize(name)
      @name = name
      self
    end
    
    def with_cpf(cpf)
      @cpf = cpf
      self
    end
    
    def with_phone(phone)
      @phone = phone
      self
    end
    
  end
  
end