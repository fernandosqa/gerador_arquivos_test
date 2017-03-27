# encoding: UTF-8

require 'csv'
require 'faker'
require 'documentos_br'
require 'json'

$lines = 1000
$count = 0

cadastro_arquivo = 'cadastro.json'

def gera_arquivo_cadastro
  celular = '319' + Faker::Number.number(8).to_s
  cpf = DocumentosBr.cpf
  return "{ \"msisdn\": \"#{celular}\", \"cpf\": \"#{cpf}\", \"userType\": \"6\", \"initialStatus\": \"1\", \"status\": \"1\" }\n"
end

File.open(cadastro_arquivo,"w") do |f|
  while $count < $lines
    f.write(gera_arquivo_cadastro)
    $count += 1
  end
end
