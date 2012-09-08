module Moiplib
  
  $MY_FILE_PATH = File.expand_path(File.dirname(__FILE__))
  
  module Config    
    require 'yaml'
    private    
    def configure(file)     
      moip = YAML.load_file(file)['moip']
      @token = moip['token']
      @key = moip['key']
      @uri = moip['uri']
    end    
  end

end