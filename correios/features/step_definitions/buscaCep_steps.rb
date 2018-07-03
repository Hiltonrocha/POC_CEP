Dado("que eu faça uma busca pelo o CEP {string}") do |cep|
    
    @request = HTTParty.get("http://apps.widenet.com.br/busca-cep/api/cep.json?",
        :query => {
            code: cep
        },
        :headers => {
            'Content-Type' => 'application/json'
        })

end
  
Então("o response code deve ser {int}") do |response_code|
    expect(@request.code).to eql response_code
end
  
Então("o nome da rua deve ser {string}") do |logradouro|
    aggregate_failures do
        expect(@request['address']).to eql logradouro
        expect(@request['status']).to eql 1
    end
end

Então("a mensagem deve ser {string}") do |msg|
    expect(@request['message']).to eql msg
end