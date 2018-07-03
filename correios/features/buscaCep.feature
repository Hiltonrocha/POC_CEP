#encoding: utf-8
#language: pt


Funcionalidade: Buscar CEP
Eu como usuário
Quero realizar uma consulta de CEP
Para verificar se o CEP é valido

@cep_valido
Cenário: Buscar CEP Valido
Dado que eu faça uma busca pelo o CEP "04857350"
Então o response code deve ser 200
E o nome da rua deve ser "Rua Falcão Peregrino"

@cep_invalido
Cenário: Cep invalido
Dado que eu faça uma busca pelo o CEP "1111111"
Então o response code deve ser 200
E a mensagem deve ser "CEP não encontrado"