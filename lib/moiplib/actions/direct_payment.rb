module Moiplib
  
  module Actions

    require 'nokogiri'
    require_relative "../buy.rb"
    
    class DirectPayment
    
      attr_reader :uri, :buy
      
      def initialize(buy)
        @uri = "/EnviarInstrucao/Unica"
        @buy = buy
      end
      
      def body
        Nokogiri::XML::Builder.new(:encoding => "UTF-8") { |xml|
          # Identificador do tipo de instrução
          xml.EnviarInstrucao {
            xml.InstrucaoUnica {
              # Dados da transação
              xml.Razao 'Razao'
              xml.Valores { xml.Valor(:moeda => "BRL") { xml.text @buy.amount } }
              xml.IdProprio @buy.id
              # Definindo o pagamento direto
              xml.PagamentoDireto {
                xml.Forma "CartaoCredito"
                # Cartão de Crédito
                xml.Instituicao @buy.card.type
                xml.CartaoCredito {
                  xml.Numero            @buy.card.number
                  xml.Expiracao         @buy.card.expiration_date
                  xml.CodigoSeguranca   @buy.card.code
                  xml.Portador {
                    xml.Nome            @buy.card.owner.name
                    xml.Identidade(:Tipo => "CPF") { @buy.card.owner.cpf }
                    xml.Telefone        @buy.card.owner.phone
                  }
                }
                xml.Parcelamento { xml.Parcelas @buy.instalments }
              }
            }
          }
        }.to_xml
      end
            
    end
    
  end
  
end