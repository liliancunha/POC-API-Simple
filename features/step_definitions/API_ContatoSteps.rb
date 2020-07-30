require_relative '../support/servico'  
require_relative '../support/conexaoDB' 

#AP1
Dado('que tenha o arquivo de payload {string} para contato') do |filePayloadNameExpected|
  @request = Servicos.new        
  @payloadRequired =  @request.returnPayloadFile("features/payloads/Contatos/#{filePayloadNameExpected}")   
end
  
Quando('é enviada uma requisição de contato usando esse arquivo') do
    @contactData = @request.inserirDados("/api/v1/Contatos", @payloadRequired)
end
  
  Então('recebe-se o status {string}') do |statusCodeExpected|
    @contactData.code.should equal? (statusCodeExpected)
  end
  
  Então('é recebido um identificador') do
    @contactData.body.should_not be_nil 
  end
  
  #AP2
  Dado('que tenha um identificador de um contato cadastrado') do
    @request = Servicos.new              
  end
  
  Quando('é consultado esse {string}') do |id|
    payloadRequired =  @request.returnPayloadFile("features/payloads/Contatos/contatoObrigatorioPayload.json")
    @response = @request.inserirDados("/api/v1/Contatos", payloadRequired) 
    binding.pry  
    @contactData = @request.getDados("/api/v1/Contatos/#{@response.id}")
    binding.pry     
  end

  Então('recebe-se os dados desse contato') do |table|
    data = table.hashes() 
    data[0]["cpf"].should equal? (@contactData['dadosContato.cpf'])  
    data[0]["nomeCompleto"].should equal? (@contactData['dadosContato.nomeCompleto'])  
    data[0]["email"].should equal? (@contact_data['dadosContato.email']) 
    data[0]["ddd"].should equal? (@contactData['dadosContato.celular.ddd']) 
    data[0]["numero"].should equal? (@contactData['dadosContato.celular.numero'])      
  end 
    
  #AP3
  Dado('que tenha o arquivo com a situação {string} para contato') do |situation|
    @request = Servicos.new        
  end
  
  Quando('é enviada uma requisição usando o arquivo {string}') do |filePayloadNameExpected|
    @payloadRequired =  @request.returnPayloadFile("features/payloads/Contatos/#{filePayloadNameExpected}")   
    @contactData = @request.inserirDados("/api/v1/Contatos", @payloadRequired)
  end
  