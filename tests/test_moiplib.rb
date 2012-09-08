require 'test/unit'
require 'moiplib'
require_relative 'helpers/request_helper'

class RequestTest < Test::Unit::TestCase
  
  include RequestHelper
  
  def test_successfuly_request
    card = get_card(get_buyer, 05, 2015)
    buy = get_buy_with(card)
    
    moip = Moiplib::Request.new
    result = moip.perform!(Moiplib::Actions::DirectPayment.new(buy))        
    
    assert_equal true, moip.success?
    assert_equal "Sucesso", result.css("Status").text
  end
  
  def test_with_invalid_month
    card = get_card(get_buyer, 13, 2015)
    buy = get_buy_with(card)
    
    moip = Moiplib::Request.new
    result = moip.perform!(Moiplib::Actions::DirectPayment.new(buy))        
    
    assert_equal false, moip.success?
    assert_equal "Falha", result.css("Status").text
  end
  
  def test_with_invalid_year
    card = get_card(get_buyer, 12, 2011)
    buy = get_buy_with(card)
    
    moip = Moiplib::Request.new
    result = moip.perform!(Moiplib::Actions::DirectPayment.new(buy))
    
    assert_equal false, moip.success?
    assert_equal "Falha", result.css("Status").text
  end
  
end