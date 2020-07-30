require 'pathname'
require "json" 

class Servicos

  include HTTParty 
 
  base_uri (URL[AMBIENTE]['url']).to_s
  
  headers "Content-Type": "application/json, charset=utf-8"
   

  def getDados(uri_parametros)  
  
    binding.pry      
    begin
      response = self.class.get(uri_parametros)
      return response 
      binding.pry
      rescue => exception
     end
  end 
 
  def inserirDados(uri_parametros, payload) 
       #begin
        response = self.class.post(uri_parametros, 
          body: payload.to_json,
        )        
        return response 
      #rescue => exception 
      #end
            
  end

  def returnPayloadFile(pathNameReceive)
    pathName = Pathname.new(pathNameReceive)
    if pathName.file?  
        @payloadRequired =  JSON.load(pathName)
    else 
      raise "Arquivo de Payload #{@payloadRequired} não pode ser lido"
    end
    return @payloadRequired
  end  
end

