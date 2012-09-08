require 'uri'
require 'net/http'
require 'moiplib/config'
require "moiplib/version"
require 'moiplib/actions/direct_payment.rb'

module Moiplib
  
  class Request
    
    include Moiplib::Config
    
    def initialize(config_file = 'config/moiplib.yml')
      configure(config_file)
      self
    end
    
    def perform!(action)
      @action = action
      @result = Nokogiri::XML(perform_request!)
    end
    
    def success?
      @result.css("Status").text == "Sucesso"
    end
    
   private
    
    def perform_request!
      uri = URI.parse(@uri + @action.uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.request(post_to(uri)).body
    end
  
    def post_to(uri)
      post = Net::HTTP::Post.new(uri.path)
      post.body = @action.body
      post.basic_auth @token, @key
      post
    end
    
  end
  
end